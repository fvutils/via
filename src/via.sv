
`include "via_macros.svh"

package via;
    typedef enum {
        VIA_KIND_OBJECT,
        VIA_KIND_COMPONENT,
        VIA_KIND_SEQUENCE,
        VIA_KIND_SEQUENCER
    } via_kind_e;

    `include "via_accept_if.svh"
    `include "via_object_if.svh"
    `include "via_component_if.svh"
    `include "via_factory_if.svh"
    `include "via_field.svh"
    `include "via_object_type_if.svh"
    `include "via_root_if.svh"
    `include "via_root.svh"
    `include "via_root_listener_if.svh"
    `include "via_sequence_if.svh"
    `include "via_sequencer_if.svh"
    `include "via_utils.svh"
    `include "via_visitor.svh"

endpackage

