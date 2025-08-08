
typedef interface class via_factory_if;
typedef class via_object_if;

// Defines the interface between an environment and its roots
interface class via_root_if;

    pure virtual function void info(int level, string msg);

    pure virtual function void error(string msg);

    pure virtual function void fatal(string msg);


endclass