# Network

The network policy is maintained in the `src/net.cil` module and in
modules located in the `src/net` directory.

The `src/net.cil` module facilitates unconfined access to network
entities. It inherits the `subj.subj_all_macro_template` template in
the `net.unconfined` container to make a type attribute and macros
available that cen be referenced to interact with entities associated
with unconfined network access.

Macros providing access to `net.unconfined.subj_typeattr`:

* `net.unconfined.change_passwd_all_subjects`
* `net.unconfined.getrlimit_all_subjects`
* `net.unconfined.getsched_all_subjects`
* `net.unconfined.nnptransition_all_subjects`
* `net.unconfined.noatsecure_all_subjects`
* `net.unconfined.nosuidtransition_all_subjects`
* `net.unconfined.ps_all_subjects`
* `net.unconfined.ptrace_all_subjects`
* `net.unconfined.read_state_all_subjects`
* `net.unconfined.read_all_inherited_fifo_files`
* `net.unconfined.readwrite_all_unix_dgram_sockets`
* `net.unconfined.readwrite_all_unix_stream_sockets`
* `net.unconfined.readwrite_all_inherited_fifo_files`
* `net.unconfined.recvfrom_all_associations`
* `net.unconfined.recvfromsendto_all_associations`
* `net.unconfined.sendto_all_associations`
* `net.unconfined.setrlimit_all_subjects`
* `net.unconfined.setsched_all_subjects`
* `net.unconfined.sigkill_all_subjects`
* `net.unconfined.signal_all_subjects`
* `net.unconfined.signull_all_subjects`
* `net.unconfined.sigstop_all_subjects`
* `net.unconfined.subj_type`
* `net.unconfined.transition_all_subjects`
* `net.unconfined.use_all_fds`
* `net.unconfined.write_all_unix_dgram_sockets`
* `net.unconfined.write_all_unix_stream_sockets`
* `net.unconfined.dontaudit_noatsecure_all_subjects`
* `net.unconfined.dontaudit_rlimitinh_all_subjects`
* `net.unconfined.dontaudit_siginh_all_subjects`

# Unconfined Access To Network

If you would for example want to associate unconfined network access
with existing subject type `myagent.subj` declared in
`src/agent/myagent.cil`:

```
# create module
cat >> src/agent/myagent.cil <<EOF
(in .myagent

       ;;
       ;; Policy
       ;;

       (call .net.unconfined.subj_type (subj)))
EOF

# build policy
make

# analyze policy
seinfo policy.31 -x -t myagent.subj
sesearch policy.31 -A -s myagent.subj
```
# Reference All Network Unconfined Associates

If you would for example want to associate a rule allowing processes
associated with the existing subject type `myagent.subj` declared in
`src/agent/myagent.cil` access to send generic signals to all subject
types associated with the `net.unconfined.subj_typeattr` type
attribute:

```
# create module
cat >> src/agent/myagent.cil <<EOF
(in .myagent

       ;;
       ;; Policy
       ;;

       (call .net.unconfined.signal_all_subjects (subj)))
EOF

# build policy
make

# analyze policy
seinfo policy.31 -x -a net.unconfined.subj_typeattr
sesearch policy.31 -A -s myagent.subj
```
