# Network Nodes

The network node policy is maintained in the `src/net/netnode.cil`
module and in modules located in the `src/net/netnode` directory.
Network nodes are referenced using `types` (netnode) and
`type attributes` (obj_typeattr).

* `net.node.obj_typeattr` all network nodes

The `src/net/netnode.cil` module facilitates access to network nodes
at a lower level. It abstracts and inherits templates that are used
to declare and provide access to network node types and type
attributes.

## src/net/netnode.cil

The `src/net/netnode.cil` module defines network nodes and access to
them at the lowest level namely "all network nodes" and in addition
declares a `node` security identifier and associated default network
node type `net.netnode`. All network nodes are associated with this
`net.netnode` network node type by default unless specified otherwise.
The network node context is associated with ip addresses and subnet
masks using `nodecon` statements.

The `net.node.obj_all_macro_template` template is only inherited in
the `net` container to make a type attribute and macros available that
can be referenced to operate on all network nodes.

Available templates:

* `net.node.obj_base_template` Declares a network node
* `net.node.obj_all_macro_template` Macros that provide access to all
network nodes
* `net.node.obj_macro_template` Macros that provide access to
a specified network node
* `net.node.obj_template` Declares a network node and includes macros
that provide access to the declared network node

Macros providing access to `net.node.obj_typeattr`:

* `net.node.dccp_bind_all_netnodes`
* `net.node.icmp_bind_all_netnodes`
* `net.node.obj_type`
* `net.node.rawip_bind_all_netnodes`
* `net.node.recvfrom_all_netnodes`
* `net.node.recvfromsendto_all_netnodes`
* `net.node.sctp_bind_all_netnodes`
* `net.node.sendto_all_netnodes`
* `net.node.tcp_bind_all_netnodes`
* `net.node.udp_bind_all_netnodes`

The `net.node.obj_template` is inherited in the `net` container
to declare the default `net.netnode` network node type to be
associated with the `node` security identifier along with a collection
of macros that can be used to operate on associated network nodes.

Full access to all network nodes is associated with the
`net.unconfined.subj_typeattr` type attribute declared in the
`src/net.cil` module.

# Private Network Node Types

Private types to be associated with network nodes are to be declared
in a `src/net/netnode` directory. If you would for
example want to declare a private `my48prefix.netnode` node type to
be associated with the `2001:db8:1::/48` IPv6 prefix:

```
# create directory if it does not exist
mkdir -p src/net/netnode

# create module
cat > src/net/netnode/my48prefixnetnode.cil <<EOF
(block my48prefix

       ;;
       ;; Contexts
       ;;

       (nodecon
       (2001:db8:1:0:0:0:0:0)
       (ffff:ffff:ffff:0:0:0:0:0)
       netnode_context)

       ;;
       ;; Policy
       ;;

       (blockinherit .net.node.obj_template))
EOF

# build policy
make

# analyze policy
seinfo policy.31 -x -t my48prefix.netnode
seinfo policy.31 -x --nodecon 2001:db8:1::1
sesearch policy.31 -A -t my48prefix.netnode
```
A comprehensive collection of macros is now available to facilitate
access to network nodes associated with the `my48prefix.netnode` node
type:

* `my48prefix.dccp_bind_netnodes`
* `my48prefix.icmp_bind_netnodes`
* `my48prefix.rawip_bind_netnodes`
* `my48prefix.recvfrom_netnodes`
* `my48prefix.recvfromsendto_netnodes`
* `my48prefix.sctp_bind_netnodes`
* `my48prefix.sendto_netnodes`
* `my48prefix.tcp_bind_netnodes`
* `my48prefix.udp_bind_netnodes`

Rules that reference all network nodes are now also automatically
associated with the `my48prefix.netnode` network node type.
