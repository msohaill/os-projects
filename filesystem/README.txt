Muhammad Sohail; ID: 260944101

--------------------------------------------------------------------------------------
----------------------------------- Included files -----------------------------------
--------------------------------------------------------------------------------------

    1. sfs.c
        Contains the main file system functions; please compile this and only this alongside
        test files. The included Makefile ensures this

    2. sfs.h
        Contains function prototypes and constant definitions for the file system. Make sure
        to #include this in your test file, i.e., #include "sfs.h"

    3. prelude.h
        A header file with constant definition, global variable declarations,
        function prototypes, and types. It is used only by internal library files

    4. table.c
        Contains functions and type defintions for operations on the open file table

    5. init.c
        Contains functions that initialize the file system (either fresh or existing)

    6. inode.c
        Contains logic and functions for interacting with iNodes and the in-memory iNode
        table and allocating/reseting iNodes

    7. freemap.c
        Contains logic and functions for interacting with the in-memory free bit map and
        allocating/freeing data blocks

    8. data.c
        Contains logic for disk operations such writing/reading from the disk, either in
        entire blocks or in bytes, as well as allocating/dealing with indirect blocks

    9. directory.c
        Contains logic for interacting with the root directory, including creating/removing
        files, finding existing files, file system iteration, and interacting with the
        directory cache

--------- The following files are those included from the inital support code ---------

    10. disk.c
        Contains functions for disk emulation

    11. disk.h
        Header containing function prototypes for disk emulation

    12. fuse/fuse_wrapper_new.c
        FUSE wrapper for initializing a fresh file system

    13. fuse/fuse_wrapper_old.c
        FUSE wrapper for initializin an existing file system

    14. tests/sfs_test[0-3].c
        Test files. Please see notes below on small changes

    15. Makefile
        Use this make file to compile an executable. Uncomment ONE of the SOURCES lines to
        compile the appropriate executable


---------------------------------------------------------------------------------------
---------------------------------------- Notes ----------------------------------------
---------------------------------------------------------------------------------------

    *   In sfs_test1.c and sfs_test2.c, I have adjusted the #define of MAX_FNAME_LENGTH to refer
        to the filesystem's constant definition of MAXFILENAME (defined in sfs.h)

    *   Again, the Makefile ensures this, but do make sure to only compile sfs.c with any other
        test files you may choose to use: gcc sfs.c disk.c test.c

    *   My implementation of files and (accordingly) the root directory, supports usage of all the
        indirect blocks

    *   In prelude.h you can see definitions for the filesystem constants such as:
          -> SYSTEM_NAME: The name of the disk file.                                DEFAULT: "filesystem.sfs"
          -> SYSTEM_MAGIC_NUMBER: The magic number associated with the filesystem.  DEFAULT: 0xACBD0005
          -> BLOCK_SIZE: The size of each disk block in bytes.                      DEFAULT: 1024
          -> NUM_BLOCKS: The number of data blocks in the disk.                     DEFAULT: 2048
          -> INODE_TABLE_SIZE: The number of iNodes in the filesystem.              DEFAULT: NUM_BLOCKS / 10 = 200

    *   Following from this, the maximum file size is

          12 * NUM_BLOCKS + (NUM_BLOCKS / 4) * NUM_BLOCKS = 274432 bytes by default

        This is relevent for sfs_test1.c and sfs_test2.c, where a file is filled up to the maximum size

    *   The filesystem supports seeks past the file size and implements dense writing (expands the file with
        0s)
