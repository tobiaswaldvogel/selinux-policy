# BPF Files

The BPF file policy is maintained in the `src/bpffile.cil`
module and in modules located in the `src/bpffile` directory.
BPF files are partitioned and are referenced at various levels
using `types` (bpffile) and `type attributes` (obj_typeattr).

* `bpffile.obj_typeattr` all BPF files

The modules that facilitate access to BPF files at a lower level
abstract and inherit templates that are used to declare and provide
access to BPF file types and type attributes.

## src/bpffile.cil

The `src/bpffile.cil` module defines BPF files and access to
them at the lowest level namely "all BPF files". There is no
default BPF file type.

The `file.obj_all_macro_template` is only inherited in the
`bpffile` container to make a type attribute and macros available
that can be referenced to operate on all BPF files.

BPF files are files that associate with BPF filesystems. Types
associated with BPF files are therefore associated with the
`file.obj_typeattr` type attribute by calling the `file.obj_type`
macro declared in the `src/file.cil` module with the `obj_typeattr`
argument in the `bpffile` container and they are also associated
with a rule that allows these types to associate with BPF
filesystems by calling the `bpf.associate_filesystems` macro
declared in the `src/fs/bpffs.cil` module with the `obj_typeattr`
argument in the `bpffile` container.

Available templates:

* `bpffile.obj_base_template` Declares a BPF file
* `bpffile.obj_all_macro_template` Macros that provide access to
all BPF files
* `bpffile.obj_macro_template` Macros that provide access to a
specified BPF file
* `bpffile.obj_template` Declares a BPF file and includes macros
that provide access to the declared BPF file

Macros providing access to `bpffile.obj_typeattr` are created by
inheriting `file.obj_all_macro_template` in the `bpffile`
container:

* `bpffile.addname_all_dirs`
* `bpffile.append_all_blk_files`
* `bpffile.append_all_chr_files`
* `bpffile.append_all_fifo_files`
* `bpffile.append_all_files`
* `bpffile.appendinherited_all_blk_files`
* `bpffile.appendinherited_all_chr_files`
* `bpffile.appendinherited_all_fifo_files`
* `bpffile.appendinherited_all_files`
* `bpffile.create_all`
* `bpffile.create_all_blk_files`
* `bpffile.create_all_chr_files`
* `bpffile.create_all_dirs`
* `bpffile.create_all_fifo_files`
* `bpffile.create_all_files`
* `bpffile.create_all_lnk_files`
* `bpffile.create_all_sock_files`
* `bpffile.deletename_all_dirs`
* `bpffile.delete_all`
* `bpffile.delete_all_blk_files`
* `bpffile.delete_all_chr_files`
* `bpffile.delete_all_dirs`
* `bpffile.delete_all_fifo_files`
* `bpffile.delete_all_files`
* `bpffile.delete_all_lnk_files`
* `bpffile.delete_all_sock_files`
* `bpffile.execute_all_files`
* `bpffile.getattr_all_files`
* `bpffile.getattr_all_lnk_files`
* `bpffile.list_all_dirs`
* `bpffile.listinherited_all_dirs`
* `bpffile.manage_all`
* `bpffile.manage_all_blk_files`
* `bpffile.manage_all_chr_files`
* `bpffile.manage_all_dirs`
* `bpffile.manage_all_fifo_files`
* `bpffile.manage_all_files`
* `bpffile.manage_all_lnk_files`
* `bpffile.manage_all_sock_files`
* `bpffile.mapexecute_all_chr_files`
* `bpffile.mapexecute_all_files`
* `bpffile.mounton_all`
* `bpffile.mounton_all_blk_files`
* `bpffile.mounton_all_chr_files`
* `bpffile.mounton_all_dirs`
* `bpffile.mounton_all_fifo_files`
* `bpffile.mounton_all_files`
* `bpffile.mounton_all_lnk_files`
* `bpffile.mounton_all_sock_files`
* `bpffile.obj_type`
* `bpffile.read_all`
* `bpffile.read_all_blk_files`
* `bpffile.read_all_chr_files`
* `bpffile.read_all_fifo_files`
* `bpffile.read_all_files`
* `bpffile.read_all_lnk_files`
* `bpffile.read_all_sock_files`
* `bpffile.readinherited_all_blk_files`
* `bpffile.readinherited_all_chr_files`
* `bpffile.readinherited_all_fifo_files`
* `bpffile.readinherited_all_files`
* `bpffile.readinherited_all_sock_files`
* `bpffile.readwrite_all`
* `bpffile.readwrite_all_blk_files`
* `bpffile.readwrite_all_chr_files`
* `bpffile.readwrite_all_dirs`
* `bpffile.readwrite_all_fifo_files`
* `bpffile.readwrite_all_files`
* `bpffile.readwrite_all_lnk_files`
* `bpffile.readwrite_all_sock_files`
* `bpffile.readwriteinherited_all_blk_files`
* `bpffile.readwriteinherited_all_chr_files`
* `bpffile.readwriteinherited_all_dirs`
* `bpffile.readwriteinherited_all_fifo_files`
* `bpffile.readwriteinherited_all_files`
* `bpffile.readwriteinherited_all_sock_files`
* `bpffile.relabel_all`
* `bpffile.relabel_all_blk_files`
* `bpffile.relabel_all_chr_files`
* `bpffile.relabel_all_dirs`
* `bpffile.relabel_all_fifo_files`
* `bpffile.relabel_all_files`
* `bpffile.relabel_all_lnk_files`
* `bpffile.relabel_all_sock_files`
* `bpffile.relabelfrom_all`
* `bpffile.relabelfrom_all_blk_files`
* `bpffile.relabelfrom_all_chr_files`
* `bpffile.relabelfrom_all_dirs`
* `bpffile.relabelfrom_all_fifo_files`
* `bpffile.relabelfrom_all_files`
* `bpffile.relabelfrom_all_lnk_files`
* `bpffile.relabelfrom_all_sock_files`
* `bpffile.relabelto_all`
* `bpffile.relabelto_all_blk_files`
* `bpffile.relabelto_all_chr_files`
* `bpffile.relabelto_all_dirs`
* `bpffile.relabelto_all_fifo_files`
* `bpffile.relabelto_all_files`
* `bpffile.relabelto_all_lnk_files`
* `bpffile.relabelto_all_sock_files`
* `bpffile.rename_all`
* `bpffile.rename_all_blk_files`
* `bpffile.rename_all_chr_files`
* `bpffile.rename_all_dirs`
* `bpffile.rename_all_fifo_files`
* `bpffile.rename_all_files`
* `bpffile.rename_all_lnk_files`
* `bpffile.rename_all_sock_files`
* `bpffile.search_all_dirs`
* `bpffile.write_all`
* `bpffile.write_all_blk_files`
* `bpffile.write_all_chr_files`
* `bpffile.write_all_dirs`
* `bpffile.write_all_fifo_files`
* `bpffile.write_all_files`
* `bpffile.write_all_lnk_files`
* `bpffile.write_all_sock_files`
* `bpffile.writeinherited_all_blk_files`
* `bpffile.writeinherited_all_chr_files`
* `bpffile.writeinherited_all_dirs`
* `bpffile.writeinherited_all_fifo_files`
* `bpffile.writeinherited_all_files`
* `bpffile.writeinherited_all_sock_files`
* `bpffile.dontaudit_manage_all_dirs`
* `bpffile.dontaudit_manage_all_files`
* `bpffile.dontaudit_manage_all_lnk_files`

# Private BPF File Types

Private types to be associated with BPF files are to be declared
in a `src/bpffile` directory. If you would for example want to
declare a private `myprog.bpffile` BPF file type to be associated
with `/sys/fs/bpf/myprog`:

```
# create directory if it does not exist
mkdir -p src/bpffile

# create module
cat > src/bpffile/myprogbpffile.cil <<EOF
(block myprog

       ;;
       ;; Contexts
       ;;

       (genfscon
       "bpf"
       "/myprog"
       bpffile_file_context)

       ;;
       ;; Policy
       ;;

       (blockinherit .bpffile.obj_template))
EOF

# build policy
make

# analyze policy
seinfo policy.31 -x -t myprog.bpffile
seinfo policy.31 -x --genfscon bpf
sesearch policy.31 -A -t myprog.bpffile
```
A comprehensive collection of macros is now available to facilitate
access to BPF files associated with the `myprog.bpffile` BPF
file type:

* `myprog.addname_bpffile_dirs`
* `myprog.append_bpffile_blk_files`
* `myprog.append_bpffile_chr_files`
* `myprog.append_bpffile_fifo_files`
* `myprog.append_bpffile_files`
* `myprog.appendinherited_bpffile_blk_files`
* `myprog.appendinherited_bpffile_chr_files`
* `myprog.appendinherited_bpffile_fifo_files`
* `myprog.appendinherited_bpffile_files`
* `myprog.bpffile_obj_type_transition`
* `myprog.create_bpffile`
* `myprog.create_bpffile_blk_files`
* `myprog.create_bpffile_chr_files`
* `myprog.create_bpffile_dirs`
* `myprog.create_bpffile_fifo_files`
* `myprog.create_bpffile_files`
* `myprog.create_bpffile_lnk_files`
* `myprog.create_bpffile_sock_files`
* `myprog.deletename_bpffile_dirs`
* `myprog.delete_bpffile`
* `myprog.delete_bpffile_blk_files`
* `myprog.delete_bpffile_chr_files`
* `myprog.delete_bpffile_dirs`
* `myprog.delete_bpffile_fifo_files`
* `myprog.delete_bpffile_files`
* `myprog.delete_bpffile_lnk_files`
* `myprog.delete_bpffile_sock_files`
* `myprog.execute_bpffile_files`
* `myprog.getattr_bpffile_files`
* `myprog.getattr_bpffile_lnk_files`
* `myprog.list_bpffile_dirs`
* `myprog.listinherited_bpffile_dirs`
* `myprog.manage_bpffile`
* `myprog.manage_bpffile_blk_files`
* `myprog.manage_bpffile_chr_files`
* `myprog.manage_bpffile_dirs`
* `myprog.manage_bpffile_fifo_files`
* `myprog.manage_bpffile_files`
* `myprog.manage_bpffile_lnk_files`
* `myprog.manage_bpffile_sock_files`
* `myprog.mapexecute_bpffile_chr_files`
* `myprog.mapexecute_bpffile_files`
* `myprog.mounton_bpffile`
* `myprog.mounton_bpffile_blk_files`
* `myprog.mounton_bpffile_chr_files`
* `myprog.mounton_bpffile_dirs`
* `myprog.mounton_bpffile_fifo_files`
* `myprog.mounton_bpffile_files`
* `myprog.mounton_bpffile_lnk_files`
* `myprog.mounton_bpffile_sock_files`
* `myprog.read_bpffile`
* `myprog.read_bpffile_blk_files`
* `myprog.read_bpffile_chr_files`
* `myprog.read_bpffile_fifo_files`
* `myprog.read_bpffile_files`
* `myprog.read_bpffile_lnk_files`
* `myprog.read_bpffile_sock_files`
* `myprog.readinherited_bpffile_blk_files`
* `myprog.readinherited_bpffile_chr_files`
* `myprog.readinherited_bpffile_fifo_files`
* `myprog.readinherited_bpffile_files`
* `myprog.readinherited_bpffile_sock_files`
* `myprog.readwrite_bpffile`
* `myprog.readwrite_bpffile_blk_files`
* `myprog.readwrite_bpffile_chr_files`
* `myprog.readwrite_bpffile_dirs`
* `myprog.readwrite_bpffile_fifo_files`
* `myprog.readwrite_bpffile_files`
* `myprog.readwrite_bpffile_lnk_files`
* `myprog.readwrite_bpffile_sock_files`
* `myprog.readwriteinherited_bpffile_blk_files`
* `myprog.readwriteinherited_bpffile_chr_files`
* `myprog.readwriteinherited_bpffile_dirs`
* `myprog.readwriteinherited_bpffile_fifo_files`
* `myprog.readwriteinherited_bpffile_files`
* `myprog.readwriteinherited_bpffile_sock_files`
* `myprog.relabel_bpffile`
* `myprog.relabel_bpffile_blk_files`
* `myprog.relabel_bpffile_chr_files`
* `myprog.relabel_bpffile_dirs`
* `myprog.relabel_bpffile_fifo_files`
* `myprog.relabel_bpffile_files`
* `myprog.relabel_bpffile_lnk_files`
* `myprog.relabel_bpffile_sock_files`
* `myprog.relabelfrom_bpffile`
* `myprog.relabelfrom_bpffile_blk_files`
* `myprog.relabelfrom_bpffile_chr_files`
* `myprog.relabelfrom_bpffile_dirs`
* `myprog.relabelfrom_bpffile_fifo_files`
* `myprog.relabelfrom_bpffile_files`
* `myprog.relabelfrom_bpffile_lnk_files`
* `myprog.relabelfrom_bpffile_sock_files`
* `myprog.relabelto_bpffile`
* `myprog.relabelto_bpffile_blk_files`
* `myprog.relabelto_bpffile_chr_files`
* `myprog.relabelto_bpffile_dirs`
* `myprog.relabelto_bpffile_fifo_files`
* `myprog.relabelto_bpffile_files`
* `myprog.relabelto_bpffile_lnk_files`
* `myprog.relabelto_bpffile_sock_files`
* `myprog.rename_bpffile`
* `myprog.rename_bpffile_blk_files`
* `myprog.rename_bpffile_chr_files`
* `myprog.rename_bpffile_dirs`
* `myprog.rename_bpffile_fifo_files`
* `myprog.rename_bpffile_files`
* `myprog.rename_bpffile_lnk_files`
* `myprog.rename_bpffile_sock_files`
* `myprog.search_bpffile_dirs`
* `myprog.write_bpffile`
* `myprog.write_bpffile_blk_files`
* `myprog.write_bpffile_chr_files`
* `myprog.write_bpffile_dirs`
* `myprog.write_bpffile_fifo_files`
* `myprog.write_bpffile_files`
* `myprog.write_bpffile_lnk_files`
* `myprog.write_bpffile_sock_files`
* `myprog.writeinherited_bpffile_blk_files`
* `myprog.writeinherited_bpffile_chr_files`
* `myprog.writeinherited_bpffile_dirs`
* `myprog.writeinherited_bpffile_fifo_files`
* `myprog.writeinherited_bpffile_files`
* `myprog.writeinherited_bpffile_sock_files`

Rules that reference all BPF files are now also automatically
associated with the `myprog.bpffile` BPF file type.
