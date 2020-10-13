# Network Interfaces

The network interface policy is maintained in the `src/net/netif.cil`
module and in modules located in the `src/net/netif` directory.
Network interfaces are referenced using `types` (netif) and
`type attributes` (obj_typeattr).

* `net.netif.obj_typeattr` all network interfaces

The `src/net/netif.cil` module facilitates access to network
interfaces at a lower level. It abstracts and inherits templates that
are used to declare and provide access to network interface types and
type attributes.

## src/net/netif.cil

The `src/net/netif.cil` module defines network interfaces and access
to them at the lowest level namely "all network interfaces" and in
addition declares a `netif` security identifier and associated
default network interface type `net.netif`. All network interfaces are
associated with this `net.netif` network interface type by default
unless specified otherwise.

The `net.netif.obj_all_macro_template` template is only inherited in
the `net` container to make a type attribute and macros available that
can be referenced to operate on all network interfaces.

Available templates:

* `net.netif.obj_base_template` Declares a network interface
* `net.netif.obj_all_macro_template` Macros that provide access to all
network interfaces
* `net.netif.obj_macro_template` Macros that provide access to
a specified network interface
* `net.netif.obj_template` Declares a network interface and includes
macros that provide access to the declared network interface

Macros providing access to `net.netif.obj_typeattr`:

* `net.netif.egress_all_netifs`
* `net.netif.egressingress_all_netifs`
* `net.netif.ingress_all_netifs`
* `net.netif.obj_type`

The `net.netif.obj_base_template` is inherited in the `net` container
to declare the default `net.netif` network interface type to be
associated with the `netif` security identifier.

Full access to all network interfaces is associated with the
`net.unconfined.subj_typeattr` type attribute declared in the
`src/net.cil` module.

# Private Network Interface Types

Private types to be associated with network interfaces are to be
declared in a `src/net/netif` directory. If you would for
example want to declare a private `myloopback.netif` interface type to
be associated with the `lo` local loopback network interface:

```
# create directory if it does not exist
mkdir -p src/net/netif

# create module
cat > src/net/netif/myloopbacknetif.cil <<EOF
(block myloopback

       ;;
       ;; Contexts
       ;;

       (netifcon
       lo
       (u r netif (systemlow systemlow))
       (u r invalid (systemlow systemlow))) ;; packets, unused

       ;;
       ;; Policy
       ;;

       (blockinherit .net.netif.obj_template))
EOF

# build policy
make

# analyze policy
seinfo policy.31 -x -t myloopback.netif
seinfo policy.31 -x --netifcon lo
sesearch policy.31 -A -t myloopback.netif
```
A comprehensive collection of macros is now available to facilitate
access to network interfaces associated with the `myloopback.netif`
interface type:

* `myloopback.egress_netifs`
* `myloopback.egressingress_netifs`
* `myloopback.ingress_netifs`

Rules that reference all network interfaces are now also automatically
associated with the `myloopback.netif` network interface type.
