# Network Infiniband End Ports

The network Infiniband (IB) end port policy is maintained in the
`src/net/netendport.cil` module and in modules located in the
`src/net/netendport` directory. Network IB end ports are referenced
using `types` (netendport) and `type attributes` (obj_typeattr).

* `net.endport.obj_typeattr` all network IB end ports

The `src/net/netendport.cil` module facilitates access to network IB
end ports at a lower level. It abstracts and inherits templates that
are used to declare and provide access to network IB end port types
and type attributes.

## src/net/netendport.cil

The `src/net/netendport.cil` module defines network IB end ports and
access to them at the lowest level namely "all network IB end ports".
There is no default network IB end port type. The network IB end port
context is associated with IB adaptor devices and IB adaptor device
ports using `ibendportcon` statements.

The `net.endport.obj_all_macro_template` template is only inherited in
the `net` container to make a type attribute and macros available that
can be referenced to operate on all network IB end ports.

Available templates:

* `net.endport.obj_base_template` Declares a network IB end port
* `net.endport.obj_all_macro_template` Macros that provide access to
all network IB end ports
* `net.endport.obj_macro_template` Macros that provide access to
a specified network IB end port
* `net.endport.obj_template` Declares a network IB end port and
includes macros that provide access to the declared network IB end
port

Macros providing access to `net.endport.obj_typeattr`:

* `net.endport.managesubnet_all_netendports`
* `net.endport.obj_type`

Full access to all network IB end ports is associated with the
`net.unconfined.subj_typeattr` type attribute declared in the
`src/net.cil` module.

# Private Network Infiniband End Ports

Private types to be associated with network IB end ports are to be
declared in a `src/net/netendport` directory. If you would for
example want to declare a private `myibnetwork.netendport` IB end port
type to be associated with the `mlx4_0` IB adaptor device and `1` IB
adaptor device port:

```
# create directory if it does not exist
mkdir -p src/net/netendport

# create module
cat > src/net/netendport/myibnetworknetendport.cil <<EOF
(block myibnetwork

       ;;
       ;; Contexts
       ;;

       (ibendportcon
       mlx4_0
       1
       netendport_context)

       ;;
       ;; Policy
       ;;

       (blockinherit .net.endport.obj_template))
EOF

# build policy
make

# analyze policy
seinfo policy.31 -x -t myibnetwork.netendport
seinfo policy.31 -x --ibendportcon mlx4_0
sesearch policy.31 -A -t myibnetwork.netendport
```
A comprehensive collection of macros is now available to facilitate
access to network IB end ports associated with the
`myibnetwork.netendport` IB end port type:

* `myibnetwork.managesubnet_netendports`

Rules that reference all network IB end ports are now also
automatically associated with the `myibnetwork.netendport` network IB
end port type.
