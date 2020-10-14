# Network IPSec Security Policy Databases

The network IPSec Security Policy Database (SPD) policy is maintained
in the `src/net/netspd.cil` module and in modules located in the
`src/net/netspd` directory. Network SPD's are referenced using
`types` (netspd) and `type attributes` (subj_typeattr).

* `net.spd.subj_typeattr` all network SPD's

The `src/net/netspd.cil` module facilitates access to network
SPD's at a lower level. It abstracts and inherits templates that
are used to declare and provide access to network SPD types and
type attributes.

## src/net/netspd.cil

The `src/net/netspd.cil` module defines network SPD's and access
to them at the lowest level namely "all network SPD's" and in
addition declares a default network SPD type `net.netspd` which can be
associated with one or more IPSec Security Policy Databases in
LibreSWAN configuration using the `policy-label=u:r:net.netspd`
directive provided that LibreSWAN is built with this functionally
enabled.

The `net.spd.subj_all_macro_template` template is only inherited in
the `net` container to make a type attribute and macros available that
can be referenced to interact with all network SPD's.

Available templates:

* `net.spd.subj_base_template` Declares a network SPD
* `net.spd.subj_all_macro_template` Macros that provide access to all
network SPD's
* `net.spd.subj_macro_template` Macros that provide access to
a specified network SPD
* `net.spd.subj_template` Declares a network SPD and includes
macros that provide access to the declared network SPD

Macros providing access to `net.spd.subj_typeattr`:

* `net.spd.polmatch_all_netspds`
* `net.spd.polmatchsetcontext_all_netspds`
* `net.spd.setcontext_all_netspds`
* `net.spd.subj_type`

Full access to all network SPD's is associated with the
`net.unconfined.subj_typeattr` type attribute declared in the
`src/net.cil` module.

# Private Network IPSec Security Policy Databases

Private types to be associated with network SPD's are to be
declared in a `src/net/netspd` directory. If you would for
example want to declare a private `mytunnel.netspd` SPD type to
be associated with a Labeled-IPSec tunnel SPD:

```
# create directory if it does not exist
mkdir -p src/net/netspd

# create module
cat > src/net/netspd/mytunnelnetspd.cil <<EOF
(block mytunnel

       ;;
       ;; Policy
       ;;

       (blockinherit .net.spd.subj_template))
EOF

# build policy
make

# analyze policy
seinfo policy.31 -x -t mytunnel.netspd
sesearch policy.31 -A -s mytunnel.netspd
sesearch policy.31 -A -t mytunnel.netspd
```
A comprehensive collection of macros is now available to facilitate
access to network SPD's associated with the `mytunnel.netspd` SPD
type:

* `mytunnel.polmatch_netspds`
* `mytunnel.polmatchsetcontext_netspds`
* `mytunnel.setcontext_netspds`

Rules that reference all network SPD's are now also automatically
associated with the `mytunnel.netspd` network SPD type.
