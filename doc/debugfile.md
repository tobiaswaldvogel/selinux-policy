# Debug Files

The Debug file policy is maintained in the `src/debugfile.cil`
module and in modules located in the `src/debugfile` directory.
Debug files are partitioned and are referenced at various levels
using `types` (debugfile) and `type attributes` (obj_typeattr).

* `debugfile.obj_typeattr` all Debug files

The modules that facilitate access to Debug files at a lower level
abstract and inherit templates that are used to declare and provide
access to Debug file types and type attributes.

## src/debugfile.cil

The `src/debugfile.cil` module defines Debug files and access to
them at the lowest level namely "all Debug files". There is no
default Debug file type. The Debug file context is associated with
files using `genfscon` statements.

The `file.obj_all_macro_template` is only inherited in the
`debugfile` container to make a type attribute and macros available
that can be referenced to operate on all Debug files.

Debug files are files that associate with Debug and Trace filesystems.
Types associated with Debug files are therefore associated with the
`file.obj_typeattr` type attribute by calling the `file.obj_type`
macro declared in the `src/file.cil` module with the `obj_typeattr`
argument in the `debugfile` container and they are also associated
with a rule that allows these types to associate with Debug and Trace
filesystems by calling the `debug.associate_filesystems` macro
declared in the `src/fs/debugfs.cil` module with the `obj_typeattr`
argument in the `debugfile` container.

Available templates:

* `debugfile.obj_base_template` Declares a Debug file
* `debugfile.obj_all_macro_template` Macros that provide access to
all Debug files
* `debugfile.obj_macro_template` Macros that provide access to a
specified Debug file
* `debugfile.obj_template` Declares a Debug file and includes macros
that provide access to the declared Debug file

Macros providing access to `debugfile.obj_typeattr` are created by
inheriting `file.obj_all_macro_template` in the `debugfile`
container:

* `debugfile.addname_all_dirs`
* `debugfile.append_all_blk_files`
* `debugfile.append_all_chr_files`
* `debugfile.append_all_fifo_files`
* `debugfile.append_all_files`
* `debugfile.appendinherited_all_blk_files`
* `debugfile.appendinherited_all_chr_files`
* `debugfile.appendinherited_all_fifo_files`
* `debugfile.appendinherited_all_files`
* `debugfile.create_all`
* `debugfile.create_all_blk_files`
* `debugfile.create_all_chr_files`
* `debugfile.create_all_dirs`
* `debugfile.create_all_fifo_files`
* `debugfile.create_all_files`
* `debugfile.create_all_lnk_files`
* `debugfile.create_all_sock_files`
* `debugfile.deletename_all_dirs`
* `debugfile.delete_all`
* `debugfile.delete_all_blk_files`
* `debugfile.delete_all_chr_files`
* `debugfile.delete_all_dirs`
* `debugfile.delete_all_fifo_files`
* `debugfile.delete_all_files`
* `debugfile.delete_all_lnk_files`
* `debugfile.delete_all_sock_files`
* `debugfile.execute_all_files`
* `debugfile.getattr_all_files`
* `debugfile.getattr_all_lnk_files`
* `debugfile.list_all_dirs`
* `debugfile.listinherited_all_dirs`
* `debugfile.manage_all`
* `debugfile.manage_all_blk_files`
* `debugfile.manage_all_chr_files`
* `debugfile.manage_all_dirs`
* `debugfile.manage_all_fifo_files`
* `debugfile.manage_all_files`
* `debugfile.manage_all_lnk_files`
* `debugfile.manage_all_sock_files`
* `debugfile.mapexecute_all_chr_files`
* `debugfile.mapexecute_all_files`
* `debugfile.mounton_all`
* `debugfile.mounton_all_blk_files`
* `debugfile.mounton_all_chr_files`
* `debugfile.mounton_all_dirs`
* `debugfile.mounton_all_fifo_files`
* `debugfile.mounton_all_files`
* `debugfile.mounton_all_lnk_files`
* `debugfile.mounton_all_sock_files`
* `debugfile.obj_type`
* `debugfile.read_all`
* `debugfile.read_all_blk_files`
* `debugfile.read_all_chr_files`
* `debugfile.read_all_fifo_files`
* `debugfile.read_all_files`
* `debugfile.read_all_lnk_files`
* `debugfile.read_all_sock_files`
* `debugfile.readinherited_all_blk_files`
* `debugfile.readinherited_all_chr_files`
* `debugfile.readinherited_all_fifo_files`
* `debugfile.readinherited_all_files`
* `debugfile.readinherited_all_sock_files`
* `debugfile.readwrite_all`
* `debugfile.readwrite_all_blk_files`
* `debugfile.readwrite_all_chr_files`
* `debugfile.readwrite_all_dirs`
* `debugfile.readwrite_all_fifo_files`
* `debugfile.readwrite_all_files`
* `debugfile.readwrite_all_lnk_files`
* `debugfile.readwrite_all_sock_files`
* `debugfile.readwriteinherited_all_blk_files`
* `debugfile.readwriteinherited_all_chr_files`
* `debugfile.readwriteinherited_all_dirs`
* `debugfile.readwriteinherited_all_fifo_files`
* `debugfile.readwriteinherited_all_files`
* `debugfile.readwriteinherited_all_sock_files`
* `debugfile.relabel_all`
* `debugfile.relabel_all_blk_files`
* `debugfile.relabel_all_chr_files`
* `debugfile.relabel_all_dirs`
* `debugfile.relabel_all_fifo_files`
* `debugfile.relabel_all_files`
* `debugfile.relabel_all_lnk_files`
* `debugfile.relabel_all_sock_files`
* `debugfile.relabelfrom_all`
* `debugfile.relabelfrom_all_blk_files`
* `debugfile.relabelfrom_all_chr_files`
* `debugfile.relabelfrom_all_dirs`
* `debugfile.relabelfrom_all_fifo_files`
* `debugfile.relabelfrom_all_files`
* `debugfile.relabelfrom_all_lnk_files`
* `debugfile.relabelfrom_all_sock_files`
* `debugfile.relabelto_all`
* `debugfile.relabelto_all_blk_files`
* `debugfile.relabelto_all_chr_files`
* `debugfile.relabelto_all_dirs`
* `debugfile.relabelto_all_fifo_files`
* `debugfile.relabelto_all_files`
* `debugfile.relabelto_all_lnk_files`
* `debugfile.relabelto_all_sock_files`
* `debugfile.rename_all`
* `debugfile.rename_all_blk_files`
* `debugfile.rename_all_chr_files`
* `debugfile.rename_all_dirs`
* `debugfile.rename_all_fifo_files`
* `debugfile.rename_all_files`
* `debugfile.rename_all_lnk_files`
* `debugfile.rename_all_sock_files`
* `debugfile.search_all_dirs`
* `debugfile.write_all`
* `debugfile.write_all_blk_files`
* `debugfile.write_all_chr_files`
* `debugfile.write_all_dirs`
* `debugfile.write_all_fifo_files`
* `debugfile.write_all_files`
* `debugfile.write_all_lnk_files`
* `debugfile.write_all_sock_files`
* `debugfile.writeinherited_all_blk_files`
* `debugfile.writeinherited_all_chr_files`
* `debugfile.writeinherited_all_dirs`
* `debugfile.writeinherited_all_fifo_files`
* `debugfile.writeinherited_all_files`
* `debugfile.writeinherited_all_sock_files`
* `debugfile.dontaudit_manage_all_dirs`
* `debugfile.dontaudit_manage_all_files`
* `debugfile.dontaudit_manage_all_lnk_files`

# Private Debug File Types

Private types to be associated with Debug files are to be declared
in a `src/debugfile` directory. If you would for example want to
declare a private `myext4events.debugfile` Debug file type to
be associated with `/sys/kernel/debug/tracing/events/ext4` and
`/sys/kernel/tracing/events/ext4`:

```
# create directory if it does not exist
mkdir -p src/debugfile

# create module
cat > src/debugfile/myext4eventsdebugfile.cil <<EOF
(block myext4events

       ;;
       ;; Contexts
       ;;

       (genfscon
       "debugfs"
       "/tracing/events/ext4"
       debugfile_file_context)

       (genfscon
       "tracefs"
       "/events/ext4"
       debugfile_file_context)

       ;;
       ;; Policy
       ;;

       (blockinherit .debugfile.obj_template))
EOF

# build policy
make

# analyze policy
seinfo policy.31 -x -t myext4events.debugfile
seinfo policy.31 -x --genfscon debugfs
seinfo policy.31 -x --genfscon tracefs
sesearch policy.31 -A -t myext4events.debugfile
```
A comprehensive collection of macros is now available to facilitate
access to Debug files associated with the `myext4events.debugfile`
Debug file type:

* `myext4events.addname_debugfile_dirs`
* `myext4events.append_debugfile_blk_files`
* `myext4events.append_debugfile_chr_files`
* `myext4events.append_debugfile_fifo_files`
* `myext4events.append_debugfile_files`
* `myext4events.appendinherited_debugfile_blk_files`
* `myext4events.appendinherited_debugfile_chr_files`
* `myext4events.appendinherited_debugfile_fifo_files`
* `myext4events.appendinherited_debugfile_files`
* `myext4events.debugfile_obj_type_transition`
* `myext4events.create_debugfile`
* `myext4events.create_debugfile_blk_files`
* `myext4events.create_debugfile_chr_files`
* `myext4events.create_debugfile_dirs`
* `myext4events.create_debugfile_fifo_files`
* `myext4events.create_debugfile_files`
* `myext4events.create_debugfile_lnk_files`
* `myext4events.create_debugfile_sock_files`
* `myext4events.deletename_debugfile_dirs`
* `myext4events.delete_debugfile`
* `myext4events.delete_debugfile_blk_files`
* `myext4events.delete_debugfile_chr_files`
* `myext4events.delete_debugfile_dirs`
* `myext4events.delete_debugfile_fifo_files`
* `myext4events.delete_debugfile_files`
* `myext4events.delete_debugfile_lnk_files`
* `myext4events.delete_debugfile_sock_files`
* `myext4events.execute_debugfile_files`
* `myext4events.getattr_debugfile_files`
* `myext4events.getattr_debugfile_lnk_files`
* `myext4events.list_debugfile_dirs`
* `myext4events.listinherited_debugfile_dirs`
* `myext4events.manage_debugfile`
* `myext4events.manage_debugfile_blk_files`
* `myext4events.manage_debugfile_chr_files`
* `myext4events.manage_debugfile_dirs`
* `myext4events.manage_debugfile_fifo_files`
* `myext4events.manage_debugfile_files`
* `myext4events.manage_debugfile_lnk_files`
* `myext4events.manage_debugfile_sock_files`
* `myext4events.mapexecute_debugfile_chr_files`
* `myext4events.mapexecute_debugfile_files`
* `myext4events.mounton_debugfile`
* `myext4events.mounton_debugfile_blk_files`
* `myext4events.mounton_debugfile_chr_files`
* `myext4events.mounton_debugfile_dirs`
* `myext4events.mounton_debugfile_fifo_files`
* `myext4events.mounton_debugfile_files`
* `myext4events.mounton_debugfile_lnk_files`
* `myext4events.mounton_debugfile_sock_files`
* `myext4events.read_debugfile`
* `myext4events.read_debugfile_blk_files`
* `myext4events.read_debugfile_chr_files`
* `myext4events.read_debugfile_fifo_files`
* `myext4events.read_debugfile_files`
* `myext4events.read_debugfile_lnk_files`
* `myext4events.read_debugfile_sock_files`
* `myext4events.readinherited_debugfile_blk_files`
* `myext4events.readinherited_debugfile_chr_files`
* `myext4events.readinherited_debugfile_fifo_files`
* `myext4events.readinherited_debugfile_files`
* `myext4events.readinherited_debugfile_sock_files`
* `myext4events.readwrite_debugfile`
* `myext4events.readwrite_debugfile_blk_files`
* `myext4events.readwrite_debugfile_chr_files`
* `myext4events.readwrite_debugfile_dirs`
* `myext4events.readwrite_debugfile_fifo_files`
* `myext4events.readwrite_debugfile_files`
* `myext4events.readwrite_debugfile_lnk_files`
* `myext4events.readwrite_debugfile_sock_files`
* `myext4events.readwriteinherited_debugfile_blk_files`
* `myext4events.readwriteinherited_debugfile_chr_files`
* `myext4events.readwriteinherited_debugfile_dirs`
* `myext4events.readwriteinherited_debugfile_fifo_files`
* `myext4events.readwriteinherited_debugfile_files`
* `myext4events.readwriteinherited_debugfile_sock_files`
* `myext4events.relabel_debugfile`
* `myext4events.relabel_debugfile_blk_files`
* `myext4events.relabel_debugfile_chr_files`
* `myext4events.relabel_debugfile_dirs`
* `myext4events.relabel_debugfile_fifo_files`
* `myext4events.relabel_debugfile_files`
* `myext4events.relabel_debugfile_lnk_files`
* `myext4events.relabel_debugfile_sock_files`
* `myext4events.relabelfrom_debugfile`
* `myext4events.relabelfrom_debugfile_blk_files`
* `myext4events.relabelfrom_debugfile_chr_files`
* `myext4events.relabelfrom_debugfile_dirs`
* `myext4events.relabelfrom_debugfile_fifo_files`
* `myext4events.relabelfrom_debugfile_files`
* `myext4events.relabelfrom_debugfile_lnk_files`
* `myext4events.relabelfrom_debugfile_sock_files`
* `myext4events.relabelto_debugfile`
* `myext4events.relabelto_debugfile_blk_files`
* `myext4events.relabelto_debugfile_chr_files`
* `myext4events.relabelto_debugfile_dirs`
* `myext4events.relabelto_debugfile_fifo_files`
* `myext4events.relabelto_debugfile_files`
* `myext4events.relabelto_debugfile_lnk_files`
* `myext4events.relabelto_debugfile_sock_files`
* `myext4events.rename_debugfile`
* `myext4events.rename_debugfile_blk_files`
* `myext4events.rename_debugfile_chr_files`
* `myext4events.rename_debugfile_dirs`
* `myext4events.rename_debugfile_fifo_files`
* `myext4events.rename_debugfile_files`
* `myext4events.rename_debugfile_lnk_files`
* `myext4events.rename_debugfile_sock_files`
* `myext4events.search_debugfile_dirs`
* `myext4events.write_debugfile`
* `myext4events.write_debugfile_blk_files`
* `myext4events.write_debugfile_chr_files`
* `myext4events.write_debugfile_dirs`
* `myext4events.write_debugfile_fifo_files`
* `myext4events.write_debugfile_files`
* `myext4events.write_debugfile_lnk_files`
* `myext4events.write_debugfile_sock_files`
* `myext4events.writeinherited_debugfile_blk_files`
* `myext4events.writeinherited_debugfile_chr_files`
* `myext4events.writeinherited_debugfile_dirs`
* `myext4events.writeinherited_debugfile_fifo_files`
* `myext4events.writeinherited_debugfile_files`
* `myext4events.writeinherited_debugfile_sock_files`

Rules that reference all Debug files are now also automatically
associated with the `myext4events.debugfile` Debug file type.
