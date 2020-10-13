# Network Ports

The network port policy is maintained in the `src/net/netport.cil`
module and in modules located in the `src/net/netport` directory.
Network ports are partitioned and are referenced at various levels
using `types` (netport) and `type attributes` (obj_typeattr).

* `net.port.obj_typeattr` all network ports (0-65535)
* `net.port.reserved.obj_typeattr` all reserved network ports (1-1023)
* `net.port.unreserved.obj_typeattr` all unreserved network ports
(1024-32767 and 61000-65535)
* `net.port.ephemeral.obj_typeattr` all ephemeral network ports
(32768-60999)

Network ports are either "reserved", "unreserved" or "ephemeral".

The modules that facilitate access to network ports at a lower level
abstract and inherit templates that are used to declare and provide
access to network port types and type attributes.

## src/net/netport.cil

The `src/net/netport.cil` module defines network ports and access to
them at the lowest level namely "all network ports" and in addition
declares a `port` security identifier and associated default network
port type `net.netport`. This type is effectively never to be
referenced because network ports are sliced into "reserved",
"unreserved" and "ephemeral" network port partitions.

The `net.port.obj_all_macro_template` is only inherited in the `net`
container to make a type attribute and macros available that can be
referenced to operate on all network ports.

Available templates:

* `net.port.obj_base_template` Declares a network port
* `net.port.obj_all_macro_template` Macros that provide access to all
network ports

Macros providing access to `net.port.obj_typeattr`:

* `net.port.dccp_bind_all_netports`
* `net.port.dccp_connect_all_netports`
* `net.port.icmp_bind_all_netports`
* `net.port.obj_type`
* `net.port.rawip_bind_all_netports`
* `net.port.sctp_bind_all_netports`
* `net.port.sctp_connect_all_netports`
* `net.port.tcp_bind_all_netports`
* `net.port.tcp_connect_all_netports`
* `net.port.udp_bind_all_netports`

The `net.port.obj_base_template` is inherited in the `net` container
to declare the default `net.netport` network port type to be
associated with the `port` security identifier and is also inherited
at the various equivalent intermediate level "reserved", "unresered"
and "ephemeral" object base templates.

Full access to all network ports is associated with the
`net.unconfined.subj_typeattr` type attribute declared in the
`src/net.cil` module.

## src/net/netport/reservednetport.cil

The `src/net/netport/reservednetport.cil` module defines network ports
and access to them at the reserved intermediate level namely
"all reserved network ports" and in addition declares a generic
reserved network port type `reserved.netport` to be associated
with network ports 1-1023 by default. The network port context is
associated with protocols and port numbers using `portcon` statements.

Available templates:

* `net.port.reserved.obj_base_template` Declares a reserved network
port
* `net.port.reserved.obj_all_macro_template` Macros that provide
access to all reserved network ports
* `net.port.reserved.obj_macro_template` Macros that provide access to
a specified reserved network port
* `net.port.reserved.obj_template` Declares a reserved network port
and includes macros that provide access to the declared reserved
network port

Macros providing access to `reserved.netport`:

* `reserved.dccp_bind_netports`
* `reserved.dccp_connect_netports`
* `reserved.icmp_bind_netports`
* `reserved.rawip_bind_netports`
* `reserved.sctp_bind_netports`
* `reserved.sctp_connect_netports`
* `reserved.tcp_bind_netports`
* `reserved.tcp_connect_netports`
* `reserved.udp_bind_netports`

Macros providing access to `net.port.reserved.obj_typeattr`:

* `net.port.reserved.dccp_bind_all_netports`
* `net.port.reserved.dccp_connect_all_netports`
* `net.port.reserved.icmp_bind_all_netports`
* `net.port.reserved.obj_type`
* `net.port.reserved.rawip_bind_all_netports`
* `net.port.reserved.sctp_bind_all_netports`
* `net.port.reserved.sctp_connect_all_netports`
* `net.port.reserved.tcp_bind_all_netports`
* `net.port.reserved.tcp_connect_all_netports`
* `net.port.reserved.udp_bind_all_netports`

## src/net/netport/unreservednetport.cil

The `src/net/netport/unreservednetport.cil` module defines network
ports and access to them at the unreserved intermediate level namely
"all unreserved network ports" and in addition declares a generic
unreserved network port type `unreserved.netport` to be associated
with network ports 1024-32767 and 61000-65535 by default. The network
port context is associated with protocols and port numbers using
`portcon` statements.

Available templates:

* `net.port.unreserved.obj_base_template` Declares a unreserved
network port
* `net.port.unreserved.obj_all_macro_template` Macros that provide
access to all unreserved network ports
* `net.port.unreserved.obj_macro_template` Macros that provide access
to a specified unreserved network port
* `net.port.unreserved.obj_template` Declares a unreserved network
port and includes macros that provide access to the declared
unreserved network port

Macros providing access to `unreserved.netport`:

* `unreserved.dccp_bind_netports`
* `unreserved.dccp_connect_netports`
* `unreserved.icmp_bind_netports`
* `unreserved.rawip_bind_netports`
* `unreserved.sctp_bind_netports`
* `unreserved.sctp_connect_netports`
* `unreserved.tcp_bind_netports`
* `unreserved.tcp_connect_netports`
* `unreserved.udp_bind_netports`

Macros providing access to `net.port.unreserved.obj_typeattr`:

* `net.port.unreserved.dccp_bind_all_netports`
* `net.port.unreserved.dccp_connect_all_netports`
* `net.port.unreserved.icmp_bind_all_netports`
* `net.port.unreserved.obj_type`
* `net.port.unreserved.rawip_bind_all_netports`
* `net.port.unreserved.sctp_bind_all_netports`
* `net.port.unreserved.sctp_connect_all_netports`
* `net.port.unreserved.tcp_bind_all_netports`
* `net.port.unreserved.tcp_connect_all_netports`
* `net.port.unreserved.udp_bind_all_netports`

## src/net/netport/ephemeralnetport.cil

The `src/net/netport/ephemeralnetport.cil` module defines network
ports and access to them at the ephemeral intermediate level namely
"all ephemeral network ports" and in addition declares a generic
ephemeral network port type `ephemeral.netport` to be associated
with network ports 32768-60999 by default. The network port context is
associated with protocols and port numbers using `portcon` statements.

Available templates:

* `net.port.ephemeral.obj_base_template` Declares a ephemeral
network port
* `net.port.ephemeral.obj_all_macro_template` Macros that provide
access to all ephemeral network ports
* `net.port.ephemeral.obj_macro_template` Macros that provide access
to a specified ephemeral network port
* `net.port.ephemeral.obj_template` Declares a ephemeral network
port and includes macros that provide access to the declared
ephemeral network port

Macros providing access to `ephemeral.netport`:

* `ephemeral.dccp_bind_netports`
* `ephemeral.dccp_connect_netports`
* `ephemeral.icmp_bind_netports`
* `ephemeral.rawip_bind_netports`
* `ephemeral.sctp_bind_netports`
* `ephemeral.sctp_connect_netports`
* `ephemeral.tcp_bind_netports`
* `ephemeral.tcp_connect_netports`
* `ephemeral.udp_bind_netports`

Macros providing access to `net.port.reserved.obj_typeattr`:

* `net.port.ephemeral.dccp_bind_all_netports`
* `net.port.ephemeral.dccp_connect_all_netports`
* `net.port.ephemeral.icmp_bind_all_netports`
* `net.port.ephemeral.obj_type`
* `net.port.ephemeral.rawip_bind_all_netports`
* `net.port.ephemeral.sctp_bind_all_netports`
* `net.port.ephemeral.sctp_connect_all_netports`
* `net.port.ephemeral.tcp_bind_all_netports`
* `net.port.ephemeral.tcp_connect_all_netports`
* `net.port.ephemeral.udp_bind_all_netports`

# Private Network Port Types

Private types to be associated with network ports are to be declared
in either `src/net/netport/reservednetport`,
`src/net/netport/unreservednetport` or
`src/net/netport/ephemeralnetport` directories depending on the port
number a given network port type is to be associated with. There are
currently various existing examples available in the
`src/net/netport/reservednetport` directory but if you would for
example want to declare a private `myephemeral.netport` port type to
be associated with protocol `tcp` and port number `50000`:

```
# create directory if it does not exist
mkdir -p src/net/netport/ephemeralnetport

# create module
cat > src/net/netport/ephemeralnetport/myephemeralnetport.cil <<EOF
(block myephemeral

       ;;
       ;; Contexts
       ;;

       (portcon
       "tcp"
       50000
       netport_context)

       ;;
       ;; Policy
       ;;

       (blockinherit .net.port.ephemeral.obj_template))
EOF

# build policy
make

# analyze policy
seinfo policy.31 -x -t myephemeral.netport
seinfo policy.31 -x --portcon 50000
sesearch policy.31 -A -t myephemeral.netport
```
A comprehensive collection of macros is now available to facilitate
access to network ports associated with the `myephemeral.netport` port
type:

* `myephemeral.dccp_bind_netports`
* `myephemeral.dccp_connect_netports`
* `myephemeral.icmp_bind_netports`
* `myephemeral.rawip_bind_netports`
* `myephemeral.sctp_bind_netports`
* `myephemeral.sctp_connect_netports`
* `myephemeral.tcp_bind_netports`
* `myephemeral.tcp_connect_netports`
* `myephemeral.udp_bind_netports`

Rules that reference all network ports, or all ephemeral network
ports are now also automatically associated with the
`myephemeral.netport` network port type.

In the example above macros for all protocols are automatically
inherited from `net.port.ephemeral.obj_macro_template`, which in turn
is inherited from `net.port.ephemeral.obj_template`. Since our
`myephemeral.netport` type is associated only with the `tcp` protocol
we could instead inherit `net.port.epehemeral.obj_base_template`
and create applicable macros manually:
```
# create directory if it does not exist
mkdir -p src/net/netport/ephemeralnetport

# create module
cat > src/net/netport/ephemeralnetport/myephemeralnetport.cil <<EOF
(block myephemeral

       ;;
       ;; Contexts
       ;;

       (portcon
       "tcp"
       50000
       netport_context)

       ;;
       ;; Macros
       ;;

       (macro tcp_bind_netports ((type ARG1))
              (allow ARG1 self create_tcp_stream_socket)
              (allow ARG1 netport (tcp_socket (name_bind))))

       (macro tcp_connect_netports ((type ARG1))
              (allow ARG1 self create_tcp_socket)
              (allow ARG1 netport (tcp_socket (name_connect))))

       ;;
       ;; Policy
       ;;

       (blockinherit .net.port.ephemeral.obj_base_template))
EOF

# build policy
make

# analyze policy
seinfo policy.31 -x -t myephemeral.netport
seinfo policy.31 -x --portcon 50000
sesearch policy.31 -A -t myephemeral.netport
```
