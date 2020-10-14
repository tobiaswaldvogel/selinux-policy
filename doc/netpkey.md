# Network Infiniband Partition Keys

The network Infiniband (IB) partition key policy is maintained in the
`src/net/netpkey.cil` module and in modules located in the
`src/net/netpkey` directory. Network IB partition keys are referenced
using `types` (netpkey) and `type attributes` (obj_typeattr).

* `net.pkey.obj_typeattr` all network IB partition keys

The `src/net/netpkey.cil` module facilitates access to network IB
partition keys at a lower level. It abstracts and inherits templates
that are used to declare and provide access to network IB partition
key types and type attributes.

## src/net/netpkey.cil

The `src/net/netpkey.cil` module defines network IB partition keys and
access to them at the lowest level namely "all network IB partition
keys". There is no default network IB partition key type. The network
IB partition key context is associated with IPv6 subnets and one or
more partition keys using `ibpkeycon` statements.

The `net.pkey.obj_all_macro_template` template is only inherited in
the `net` container to make a type attribute and macros available that
can be referenced to operate on all network IB partition keys.

Available templates:

* `net.pkey.obj_base_template` Declares a network IB partition key
* `net.pkey.obj_all_macro_template` Macros that provide access to
all network IB partition keys
* `net.pkey.obj_macro_template` Macros that provide access to
a specified network IB partition key
* `net.pkey.obj_template` Declares a network IB partition key and
includes macros that provide access to the declared network IB
partition key

Macros providing access to `net.pkey.obj_typeattr`:

* `net.pkey.access_all_netpkeys`
* `net.pkey.obj_type`

Full access to all network IB partition keys is associated with the
`net.unconfined.subj_typeattr` type attribute declared in the
`src/net.cil` module.

# Private Network Infiniband Partition Keys

Private types to be associated with network IB partition keys are to
be declared in a `src/net/netpkey` directory. If you would for
example want to declare a private `myibpart.netpkey` IB partition key
type to be associated with the `2001:db8::` IPv6 subnet and `0-0x10`
range of IB partition keys:

```
# create directory if it does not exist
mkdir -p src/net/netpkey

# create module
cat > src/net/netpkey/myibpartnetpkey.cil <<EOF
(block myibpart

       ;;
       ;; Contexts
       ;;

       (ibpkeycon
       2001:db8::
       (0 0x10)
       netpkey_context)

       ;;
       ;; Policy
       ;;

       (blockinherit .net.pkey.obj_template))
EOF

# build policy
make

# analyze policy
seinfo policy.31 -x -t myibpart.netpkey
seinfo policy.31 -x --ibpkeycon 0
sesearch policy.31 -A -t myibpart.netpkey
```
A comprehensive collection of macros is now available to facilitate
access to network IB partition keys associated with the
`myibpart.netpkey` IB partition key type:

* `myibpart.access_netpkeys`

Rules that reference all network IB partition keys are now also
automatically associated with the `myibpart.netpkey` network IB
partition key type.
