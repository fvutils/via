
class via_uvm_object_type extends via_object_type_if;
    uvm_object_wrapper      m_type;
    via_field               m_fields[$];
    bit                     m_fields_valid;

    function new(uvm_object_wrapper t);
        m_type = t;
    endfunction

    virtual function string get_name();
        return m_type.get_type_name();
    endfunction

    virtual function void get_fields(ref via_field fields[$]);
        if (!m_fields_valid) begin
            uvm_object obj = m_type.create_object();
            populate_fields(obj.sprint());

            $display("post-populate: %0d", m_fields.size());

            m_fields_valid = 1'b1;
        end

        foreach (m_fields[i]) begin
            fields.push_back(m_fields[i]);
        end
    endfunction

    function int strchr(string str, byte c, int start=0);
        int ret = -1;
        for (int i=start; i<str.len(); i++) begin
            if (str.getc(i) == c) begin
                ret = i;
                break;
            end
        end
        return ret;
    endfunction

    function void populate_fields(string layout);
        string lines[$];
        string tokens[$];
        via_uvm_object_type cls;
        string line;
        int count;

        $display("parse:\n%0s", layout);

        // Split layout into lines
        while (layout != "") begin
            int newline = strchr(layout, "\n");
            if (newline == -1) begin
                lines.push_back(layout);
                layout = "";
            end else begin
                lines.push_back(layout.substr(0, newline));
                layout = layout.substr(newline+1, layout.len()-1);
            end
        end

        // Process each line
        foreach (lines[i]) begin
            line = lines[i];

            // Skip separator lines and empty lines
            if (line.len() == 0 || line[0] == "-") continue;

            // Split line into tokens
            tokens.delete();
            while (line != "" && line[0] == " ") line = line.substr(1, line.len()-1); // Trim leading spaces
            while (line != "") begin
                int space = strchr(line, " ");
                if (space == -1) begin
                    if (line != "") tokens.push_back(line);
                    line = "";
                end else begin
                    string token = line.substr(0, space-1);
                    if (token != "") tokens.push_back(token);
                    line = line.substr(space+1, line.len()-1);
                    while (line != "" && line[0] == " ") line = line.substr(1, line.len()-1);
                end
            end

            if (count == 0) begin
                // Ignore
            end else if (count == 1) begin
                // Save type
                $display("Type: %0s", tokens[1]);
            end else if (tokens.size() >= 3) begin
                // Process tokens
                string field_name = tokens[0];
                int size;

                // Distinguish string, int, list, array, object
                // Skip class line (contains "-" for size)
                if (tokens[2] == "-") continue;

                // Convert size string to integer
                size = tokens[2].atoi();

                // Create and add field
                begin
                    via_field field = new(field_name, FIELD_KIND_INT, size, 0); // Assuming unsigned for now
                    $display("Field: %0s, %0d", field_name, size);
                    m_fields.push_back(field);
                end
            end
            count += 1;
        end
    endfunction


endclass
