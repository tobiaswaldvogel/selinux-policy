# Cgroup Files

The Cgroup file policy is maintained in the `src/cgroupfile.cil`
module and in modules located in the `src/cgroupfile` directory.
Cgroup files are partitioned and are referenced at various levels
using `types` (cgroupfile) and `type attributes` (obj_typeattr).

* `cgroupfile.obj_typeattr` all Cgroup files

The modules that facilitate access to Cgroup files at a lower level
abstract and inherit templates that are used to declare and provide
access to Cgroup file types and type attributes.

## src/cgroupfile.cil

The `src/cgroupfile.cil` module defines Cgroup files and access to
them at the lowest level namely "all Cgroup files". There is no
default Cgroup file type. The Cgroup file context is associated with
files using `genfscon` statements.

The `file.obj_all_macro_template` is only inherited in the
`cgroupfile` container to make a type attribute and macros available
that can be referenced to operate on all Cgroup files.

Cgroup files are files that associate with Cgroup filesystems. Types
associated with Cgroup files are therefore associated with the
`file.obj_typeattr` type attribute by calling the `file.obj_type`
macro declared in the `src/file.cil` module with the `obj_typeattr`
argument in the `cgroupfile` container and they are also associated
with a rule that allows these types to associate with Cgroup
filesystems by calling the `cgroup.associate_filesystems` macro
declared in the `src/fs/cgroupfs.cil` module with the `obj_typeattr`
argument in the `cgroupfile` container.

Available templates:

* `cgroupfile.obj_base_template` Declares a Cgroup file
* `cgroupfile.obj_all_macro_template` Macros that provide access to
all Cgroup files
* `cgroupfile.obj_macro_template` Macros that provide access to a
specified Cgroup file
* `cgroupfile.obj_template` Declares a Cgroup file and includes macros
that provide access to the declared Cgroup file

Macros providing access to `cgroupfile.obj_typeattr` are created by
inheriting `file.obj_all_macro_template` in the `cgroupfile`
container:

* `cgroupfile.addname_all_dirs`
* `cgroupfile.append_all_blk_files`
* `cgroupfile.append_all_chr_files`
* `cgroupfile.append_all_fifo_files`
* `cgroupfile.append_all_files`
* `cgroupfile.appendinherited_all_blk_files`
* `cgroupfile.appendinherited_all_chr_files`
* `cgroupfile.appendinherited_all_fifo_files`
* `cgroupfile.appendinherited_all_files`
* `cgroupfile.create_all`
* `cgroupfile.create_all_blk_files`
* `cgroupfile.create_all_chr_files`
* `cgroupfile.create_all_dirs`
* `cgroupfile.create_all_fifo_files`
* `cgroupfile.create_all_files`
* `cgroupfile.create_all_lnk_files`
* `cgroupfile.create_all_sock_files`
* `cgroupfile.deletename_all_dirs`
* `cgroupfile.delete_all`
* `cgroupfile.delete_all_blk_files`
* `cgroupfile.delete_all_chr_files`
* `cgroupfile.delete_all_dirs`
* `cgroupfile.delete_all_fifo_files`
* `cgroupfile.delete_all_files`
* `cgroupfile.delete_all_lnk_files`
* `cgroupfile.delete_all_sock_files`
* `cgroupfile.execute_all_files`
* `cgroupfile.getattr_all_files`
* `cgroupfile.getattr_all_lnk_files`
* `cgroupfile.list_all_dirs`
* `cgroupfile.listinherited_all_dirs`
* `cgroupfile.manage_all`
* `cgroupfile.manage_all_blk_files`
* `cgroupfile.manage_all_chr_files`
* `cgroupfile.manage_all_dirs`
* `cgroupfile.manage_all_fifo_files`
* `cgroupfile.manage_all_files`
* `cgroupfile.manage_all_lnk_files`
* `cgroupfile.manage_all_sock_files`
* `cgroupfile.mapexecute_all_chr_files`
* `cgroupfile.mapexecute_all_files`
* `cgroupfile.mounton_all`
* `cgroupfile.mounton_all_blk_files`
* `cgroupfile.mounton_all_chr_files`
* `cgroupfile.mounton_all_dirs`
* `cgroupfile.mounton_all_fifo_files`
* `cgroupfile.mounton_all_files`
* `cgroupfile.mounton_all_lnk_files`
* `cgroupfile.mounton_all_sock_files`
* `cgroupfile.obj_type`
* `cgroupfile.read_all`
* `cgroupfile.read_all_blk_files`
* `cgroupfile.read_all_chr_files`
* `cgroupfile.read_all_fifo_files`
* `cgroupfile.read_all_files`
* `cgroupfile.read_all_lnk_files`
* `cgroupfile.read_all_sock_files`
* `cgroupfile.readinherited_all_blk_files`
* `cgroupfile.readinherited_all_chr_files`
* `cgroupfile.readinherited_all_fifo_files`
* `cgroupfile.readinherited_all_files`
* `cgroupfile.readinherited_all_sock_files`
* `cgroupfile.readwrite_all`
* `cgroupfile.readwrite_all_blk_files`
* `cgroupfile.readwrite_all_chr_files`
* `cgroupfile.readwrite_all_dirs`
* `cgroupfile.readwrite_all_fifo_files`
* `cgroupfile.readwrite_all_files`
* `cgroupfile.readwrite_all_lnk_files`
* `cgroupfile.readwrite_all_sock_files`
* `cgroupfile.readwriteinherited_all_blk_files`
* `cgroupfile.readwriteinherited_all_chr_files`
* `cgroupfile.readwriteinherited_all_dirs`
* `cgroupfile.readwriteinherited_all_fifo_files`
* `cgroupfile.readwriteinherited_all_files`
* `cgroupfile.readwriteinherited_all_sock_files`
* `cgroupfile.relabel_all`
* `cgroupfile.relabel_all_blk_files`
* `cgroupfile.relabel_all_chr_files`
* `cgroupfile.relabel_all_dirs`
* `cgroupfile.relabel_all_fifo_files`
* `cgroupfile.relabel_all_files`
* `cgroupfile.relabel_all_lnk_files`
* `cgroupfile.relabel_all_sock_files`
* `cgroupfile.relabelfrom_all`
* `cgroupfile.relabelfrom_all_blk_files`
* `cgroupfile.relabelfrom_all_chr_files`
* `cgroupfile.relabelfrom_all_dirs`
* `cgroupfile.relabelfrom_all_fifo_files`
* `cgroupfile.relabelfrom_all_files`
* `cgroupfile.relabelfrom_all_lnk_files`
* `cgroupfile.relabelfrom_all_sock_files`
* `cgroupfile.relabelto_all`
* `cgroupfile.relabelto_all_blk_files`
* `cgroupfile.relabelto_all_chr_files`
* `cgroupfile.relabelto_all_dirs`
* `cgroupfile.relabelto_all_fifo_files`
* `cgroupfile.relabelto_all_files`
* `cgroupfile.relabelto_all_lnk_files`
* `cgroupfile.relabelto_all_sock_files`
* `cgroupfile.rename_all`
* `cgroupfile.rename_all_blk_files`
* `cgroupfile.rename_all_chr_files`
* `cgroupfile.rename_all_dirs`
* `cgroupfile.rename_all_fifo_files`
* `cgroupfile.rename_all_files`
* `cgroupfile.rename_all_lnk_files`
* `cgroupfile.rename_all_sock_files`
* `cgroupfile.search_all_dirs`
* `cgroupfile.write_all`
* `cgroupfile.write_all_blk_files`
* `cgroupfile.write_all_chr_files`
* `cgroupfile.write_all_dirs`
* `cgroupfile.write_all_fifo_files`
* `cgroupfile.write_all_files`
* `cgroupfile.write_all_lnk_files`
* `cgroupfile.write_all_sock_files`
* `cgroupfile.writeinherited_all_blk_files`
* `cgroupfile.writeinherited_all_chr_files`
* `cgroupfile.writeinherited_all_dirs`
* `cgroupfile.writeinherited_all_fifo_files`
* `cgroupfile.writeinherited_all_files`
* `cgroupfile.writeinherited_all_sock_files`
* `cgroupfile.dontaudit_manage_all_dirs`
* `cgroupfile.dontaudit_manage_all_files`
* `cgroupfile.dontaudit_manage_all_lnk_files`

# Private Cgroup File Types

Private types to be associated with Cgroup files are to be declared
in a `src/cgroupfile` directory. If you would for example want to
declare a private `mygroup.cgroupfile` Cgroup file type to
be associated with files under `/sys/fs/cgroup/mygroup`:

```
# create directory if it does not exist
mkdir -p src/cgroupfile

# create module
cat > src/cgroupfile/mygroupcgroupfile.cil <<EOF
(block mygroup

       ;;
       ;; Contexts
       ;;

       (genfscon
       "cgroup2"
       "/mygroup"
       cgroupfile_file_context)

       ;;
       ;; Policy
       ;;

       (blockinherit .cgroupfile.obj_template))
EOF

# build policy
make

# analyze policy
seinfo policy.31 -x -t mygroup.cgroupfile
seinfo policy.31 -x --genfscon cgroup2
sesearch policy.31 -A -t mygroup.cgroupfile
```
A comprehensive collection of macros is now available to facilitate
access to Cgroup files associated with the `mygroup.cgroupfile` Cgroup
file type:

* `mygroup.addname_cgroupfile_dirs`
* `mygroup.append_cgroupfile_blk_files`
* `mygroup.append_cgroupfile_chr_files`
* `mygroup.append_cgroupfile_fifo_files`
* `mygroup.append_cgroupfile_files`
* `mygroup.appendinherited_cgroupfile_blk_files`
* `mygroup.appendinherited_cgroupfile_chr_files`
* `mygroup.appendinherited_cgroupfile_fifo_files`
* `mygroup.appendinherited_cgroupfile_files`
* `mygroup.cgroupfile_obj_type_transition`
* `mygroup.create_cgroupfile`
* `mygroup.create_cgroupfile_blk_files`
* `mygroup.create_cgroupfile_chr_files`
* `mygroup.create_cgroupfile_dirs`
* `mygroup.create_cgroupfile_fifo_files`
* `mygroup.create_cgroupfile_files`
* `mygroup.create_cgroupfile_lnk_files`
* `mygroup.create_cgroupfile_sock_files`
* `mygroup.deletename_cgroupfile_dirs`
* `mygroup.delete_cgroupfile`
* `mygroup.delete_cgroupfile_blk_files`
* `mygroup.delete_cgroupfile_chr_files`
* `mygroup.delete_cgroupfile_dirs`
* `mygroup.delete_cgroupfile_fifo_files`
* `mygroup.delete_cgroupfile_files`
* `mygroup.delete_cgroupfile_lnk_files`
* `mygroup.delete_cgroupfile_sock_files`
* `mygroup.execute_cgroupfile_files`
* `mygroup.getattr_cgroupfile_files`
* `mygroup.getattr_cgroupfile_lnk_files`
* `mygroup.list_cgroupfile_dirs`
* `mygroup.listinherited_cgroupfile_dirs`
* `mygroup.manage_cgroupfile`
* `mygroup.manage_cgroupfile_blk_files`
* `mygroup.manage_cgroupfile_chr_files`
* `mygroup.manage_cgroupfile_dirs`
* `mygroup.manage_cgroupfile_fifo_files`
* `mygroup.manage_cgroupfile_files`
* `mygroup.manage_cgroupfile_lnk_files`
* `mygroup.manage_cgroupfile_sock_files`
* `mygroup.mapexecute_cgroupfile_chr_files`
* `mygroup.mapexecute_cgroupfile_files`
* `mygroup.mounton_cgroupfile`
* `mygroup.mounton_cgroupfile_blk_files`
* `mygroup.mounton_cgroupfile_chr_files`
* `mygroup.mounton_cgroupfile_dirs`
* `mygroup.mounton_cgroupfile_fifo_files`
* `mygroup.mounton_cgroupfile_files`
* `mygroup.mounton_cgroupfile_lnk_files`
* `mygroup.mounton_cgroupfile_sock_files`
* `mygroup.read_cgroupfile`
* `mygroup.read_cgroupfile_blk_files`
* `mygroup.read_cgroupfile_chr_files`
* `mygroup.read_cgroupfile_fifo_files`
* `mygroup.read_cgroupfile_files`
* `mygroup.read_cgroupfile_lnk_files`
* `mygroup.read_cgroupfile_sock_files`
* `mygroup.readinherited_cgroupfile_blk_files`
* `mygroup.readinherited_cgroupfile_chr_files`
* `mygroup.readinherited_cgroupfile_fifo_files`
* `mygroup.readinherited_cgroupfile_files`
* `mygroup.readinherited_cgroupfile_sock_files`
* `mygroup.readwrite_cgroupfile`
* `mygroup.readwrite_cgroupfile_blk_files`
* `mygroup.readwrite_cgroupfile_chr_files`
* `mygroup.readwrite_cgroupfile_dirs`
* `mygroup.readwrite_cgroupfile_fifo_files`
* `mygroup.readwrite_cgroupfile_files`
* `mygroup.readwrite_cgroupfile_lnk_files`
* `mygroup.readwrite_cgroupfile_sock_files`
* `mygroup.readwriteinherited_cgroupfile_blk_files`
* `mygroup.readwriteinherited_cgroupfile_chr_files`
* `mygroup.readwriteinherited_cgroupfile_dirs`
* `mygroup.readwriteinherited_cgroupfile_fifo_files`
* `mygroup.readwriteinherited_cgroupfile_files`
* `mygroup.readwriteinherited_cgroupfile_sock_files`
* `mygroup.relabel_cgroupfile`
* `mygroup.relabel_cgroupfile_blk_files`
* `mygroup.relabel_cgroupfile_chr_files`
* `mygroup.relabel_cgroupfile_dirs`
* `mygroup.relabel_cgroupfile_fifo_files`
* `mygroup.relabel_cgroupfile_files`
* `mygroup.relabel_cgroupfile_lnk_files`
* `mygroup.relabel_cgroupfile_sock_files`
* `mygroup.relabelfrom_cgroupfile`
* `mygroup.relabelfrom_cgroupfile_blk_files`
* `mygroup.relabelfrom_cgroupfile_chr_files`
* `mygroup.relabelfrom_cgroupfile_dirs`
* `mygroup.relabelfrom_cgroupfile_fifo_files`
* `mygroup.relabelfrom_cgroupfile_files`
* `mygroup.relabelfrom_cgroupfile_lnk_files`
* `mygroup.relabelfrom_cgroupfile_sock_files`
* `mygroup.relabelto_cgroupfile`
* `mygroup.relabelto_cgroupfile_blk_files`
* `mygroup.relabelto_cgroupfile_chr_files`
* `mygroup.relabelto_cgroupfile_dirs`
* `mygroup.relabelto_cgroupfile_fifo_files`
* `mygroup.relabelto_cgroupfile_files`
* `mygroup.relabelto_cgroupfile_lnk_files`
* `mygroup.relabelto_cgroupfile_sock_files`
* `mygroup.rename_cgroupfile`
* `mygroup.rename_cgroupfile_blk_files`
* `mygroup.rename_cgroupfile_chr_files`
* `mygroup.rename_cgroupfile_dirs`
* `mygroup.rename_cgroupfile_fifo_files`
* `mygroup.rename_cgroupfile_files`
* `mygroup.rename_cgroupfile_lnk_files`
* `mygroup.rename_cgroupfile_sock_files`
* `mygroup.search_cgroupfile_dirs`
* `mygroup.write_cgroupfile`
* `mygroup.write_cgroupfile_blk_files`
* `mygroup.write_cgroupfile_chr_files`
* `mygroup.write_cgroupfile_dirs`
* `mygroup.write_cgroupfile_fifo_files`
* `mygroup.write_cgroupfile_files`
* `mygroup.write_cgroupfile_lnk_files`
* `mygroup.write_cgroupfile_sock_files`
* `mygroup.writeinherited_cgroupfile_blk_files`
* `mygroup.writeinherited_cgroupfile_chr_files`
* `mygroup.writeinherited_cgroupfile_dirs`
* `mygroup.writeinherited_cgroupfile_fifo_files`
* `mygroup.writeinherited_cgroupfile_files`
* `mygroup.writeinherited_cgroupfile_sock_files`

Rules that reference all Cgroup files are now also automatically
associated with the `mygroup.cgroupfile` Cgroup file type.

In the example above macros for all file classes are automatically
inherited from `cgroupfile.obj_macro_template`, which in turn
is inherited from `cgroupfile.obj_template`. Since Cgroup files are
usually files we could instead inherit `cgroupfile.obj_base_template`
and create only applicable macros manually:
```
# create directory if it does not exist
mkdir -p src/cgroupfile

# create module
cat > src/cgroupfile/mygroupcgroupfile.cil <<EOF
(block mygroup

       ;;
       ;; Contexts
       ;;

       (genfscon
       "cgroup2"
       "/mygroup"
       cgroupfile_file_context)

       ;;
       ;; Macros
       ;;

       (macro append_cgroupfile_files ((type ARG1))
              (allow ARG1 cgroupfile append_file))

       (macro appendinherited_cgroupfile_files ((type ARG1))
              (allow ARG1 cgroupfile appendinherited_file))

       (macro create_cgroupfile_files ((type ARG1))
              (allow ARG1 cgroupfile create_file))

       (macro delete_cgroupfile_files ((type ARG1))
              (allow ARG1 cgroupfile delete_file))

       (macro execute_cgroupfile_files ((type ARG1))
              (allow ARG1 cgroupfile execute_file))

       (macro manage_cgroupfile_files ((type ARG1))
              (allow ARG1 cgroupfile manage_file))

       (macro mapexecute_cgroupfile_files ((type ARG1))
              (allow ARG1 cgroupfile mapexecute_file))

       (macro mounton_cgroupfile_files ((type ARG1))
              (allow ARG1 cgroupfile mounton_file))

       (macro read_cgroupfile_files ((type ARG1))
              (allow ARG1 cgroupfile read_file))

       (macro readinherited_cgroupfile_files ((type ARG1))
              (allow ARG1 cgroupfile readinherited_file))

       (macro readwrite_cgroupfile_files ((type ARG1))
              (allow ARG1 cgroupfile readwrite_file))

       (macro readwriteinherited_cgroupfile_files ((type ARG1))
              (allow ARG1 cgroupfile readwriteinherited_file))

       (macro relabel_cgroupfile_files ((type ARG1))
              (allow ARG1 cgroupfile relabel_file))

       (macro relabelfrom_cgroupfile_files ((type ARG1))
              (allow ARG1 cgroupfile relabelfrom_file))

       (macro relabelto_cgroupfile_files ((type ARG1))
              (allow ARG1 cgroupfile relabelto_file))

       (macro rename_cgroupfile_files ((type ARG1))
              (allow ARG1 cgroupfile rename_file))

       (macro write_cgroupfile_files ((type ARG1))
              (allow ARG1 cgroupfile write_file))

       (macro writeinherited_cgroupfile_files ((type ARG1))
              (allow ARG1 cgroupfile writeinherited_file))

       ;;
       ;; Policy
       ;;

       (blockinherit .cgroupfile.obj_base_template))
EOF

# build policy
make

# analyze policy
seinfo policy.31 -x -t mygroup.cgroupfile
seinfo policy.31 -x --genfscon cgroup2
sesearch policy.31 -A -t mygroup.cgroupfile
```
