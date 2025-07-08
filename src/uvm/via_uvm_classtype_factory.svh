

class via_uvm_classtype_factory;

    function via_class_type parse(string name, string layout);
        string lines[$];
        string tokens[$];
        via_class_type cls;
        string line;
        
        // Split layout into lines
        while (layout != "") begin
            int newline = layout.find("\n");
            if (newline == -1) begin
                lines.push_back(layout);
                layout = "";
            end else begin
                lines.push_back(layout.substr(0, newline-1));
                layout = layout.substr(newline+1);
            end
        end
        
        // Create new class type with given name
        cls = new(name);
        
        // Process each line
        foreach (lines[i]) begin
            line = lines[i];
            
            // Skip separator lines and empty lines
            if (line.len() == 0 || line[0] == "-") continue;
            
            // Split line into tokens
            tokens.delete();
            while (line != "" && line[0] == " ") line = line.substr(1); // Trim leading spaces
            while (line != "") begin
                int space = line.find(" ");
                if (space == -1) begin
                    if (line != "") tokens.push_back(line);
                    line = "";
                end else begin
                    string token = line.substr(0, space-1);
                    if (token != "") tokens.push_back(token);
                    line = line.substr(space+1);
                    while (line != "" && line[0] == " ") line = line.substr(1);
                end
            end
            
            // Process tokens
            if (tokens.size() >= 3) begin
                string field_name = tokens[0];
                int size;
                
                // Skip class line (contains "-" for size)
                if (tokens[2] == "-") continue;
                
                // Convert size string to integer
                size = tokens[2].atoi();
                
                // Create and add field
                via_field_int field = new(field_name, size, 0); // Assuming unsigned for now
                cls.fields.push_back(field);
            end
        end
        
        return cls;
    endfunction

endclass
