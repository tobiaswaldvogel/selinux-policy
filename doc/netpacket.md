# Network Packets

The network packet policy is maintained in the `src/net/netpacket.cil`
module and in modules located in the `src/net/netpacket` directory.
Network packets are referenced using `types` (netpacket) and
`type attributes` (obj_typeattr).

* `net.packet.obj_typeattr` all network packets

The `src/net/netpacket.cil` module facilitates access to network
packets at a lower level. It abstracts and inherits templates that
are used to declare and provide access to network packet types and
type attributes.

## src/net/netpacket.cil

The `src/net/netpacket.cil` module defines network packets and access
to them at the lowest level namely "all network packets". There is no
default network packet type.

The `net.packet.obj_all_macro_template` template is only inherited in
the `net` container to make a type attribute and macros available that
can be referenced to operate on all network packets.

Available templates:

* `net.packet.obj_base_template` Declares a network packet
* `net.packet.obj_all_macro_template` Macros that provide access to
all network packets
* `net.packet.obj_macro_template` Macros that provide access to
a specified network packet
* `net.packet.obj_template` Declares a network packet and includes
macros that provide access to the declared network packet

Macros providing access to `net.packet.obj_typeattr`:

* `net.packet.forward_all_netpackets`
* `net.packet.forwardin_all_netpackets`
* `net.packet.forwardout_all_netpackets`
* `net.packet.obj_type`
* `net.packet.recv_all_netpackets`
* `net.packet.recvsend_all_netpackets`
* `net.packet.relabelto_all_netpackets`
* `net.packet.send_all_netpackets`

Full access to all network packets is associated with the
`net.unconfined.subj_typeattr` type attribute declared in the
`src/net.cil` module.

# Private Network Packet Types

Private types to be associated with network packets are to be declared
in a `src/net/netpacket` directory. If you would for
example want to declare a private `myinternal.netpacket` packet type
to be associated with protocols, network interfaces, ip adressses or
port numbers:

```
# create directory if it does not exist
mkdir -p src/net/netpacket

# create module
cat > src/net/netpacket/myinternalnetpacket.cil <<EOF
(block myinternal

       ;;
       ;; Policy
       ;;

       (blockinherit .net.packet.obj_template))
EOF

# build policy
make

# analyze policy
seinfo policy.31 -x -t myinternal.netpacket
sesearch policy.31 -A -t myinternal.netpacket
```
A comprehensive collection of macros is now available to facilitate
access to network packets associated with the `myinternal.netpacket`
packet type:

* `myinternal.forward_netpackets`
* `myinternal.forwardin_netpackets`
* `myinternal.forwardout_netpackets`
* `myinternal.recv_netpackets`
* `myinternal.recvsend_netpackets`
* `myinternal.relabelto_netpackets`
* `myinternal.send_netpackets`

Rules that reference all network packets are now also automatically
associated with the `myinternal.netpacket` network packet type.

Network packet types can be associated with protocols,
network interfaces, ip addresses, and port numbers using the
`iptables` and `nft` commands if the kernel supports `secmark` and if
the respective commands are built with `secmark` support. Packets are
labeled as they flow into system and do not traverse networks.

For a `nft` `secmark` example see:
<https://git.netfilter.org/nftables/plain/files/examples/secmark.nft>
