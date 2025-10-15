+++
bigimg = ""
date = "2017-09-10T10:54:24+09:00"
subtitle = ""
title = "TPC-H on MariaDB (MySQL)"
tags = ["tpch", "benchmark", "tpc-h", "mariadb", "mysql"]
categories = ["tip"]

+++

Benchmarks for Database can be roughly divided into two kinds, OLTP and
OLAP[1].
One of the most popular OLTP benchamrks is TPC-C, while that of OLAP is
TPC-H[2].
This post describes how you can run TPC-H against MariaDB.


Environment Setup
=================

The versions of the OS and programs I used for writeup of this post are as
below.

- Ubuntu 16.04.2 Server
- MariaDB 10.2.8
- TPC-H toolkit 2.17.2


Automated Scripts
=================

I automated whole things I will describe below using scripts and uploaded the
scripts to the Github:
https://github.com/sjp38/tpch-mariadb

If you hano no time, just go to the link and use the script.


TPC-H Spec
==========

You can ge TPC-H benchmark specification from TPC website[3].
Refer to it if you need strict specification of the benchmark.
Nonetheless, I give you a rough description of the benchmark here, though.
TPC-H stores a huge data into 8 tables and run 22 queries analysing this data.
To measure the performance, we can measure the time to store/load the data,
runtime of each of the 22 queries, and the throughput (number of processed
queries per second) of multiple sessions.


Get TPC-H Toolkit
=================

TPC provides the specification says how the tables should be constructed, what
data should be stored in the tables, and what kind of queries should be issued.
So, anyone can implement their TPC-H based on this specification.
Nonetheless, as manual read of the specification and manual implementation can
be boring and exhaustive to someone.
For the reason, TPC officially provides a tool, namely `TPC-H Toolkit`, that
helps creation of the tables, the data, and the queries.
If you go to the site[4], enter your personal information, and agree to the
license, they will send you a link to download the TPC-H Toolkit by mail.

The file is in zip format.
After extracting the file, you can get the directory named by the version of
the toolkit.
The source code and license file is under the directory.
We will use `dbgen/` directory here.

```
$ tree 2.17.2 -L 1
2.17.2
├── dbgen
├── dev-tools
├── EULA.txt
└── ref_data
```


Build Source Code
=================

Under the `dbgen/`, there are source code of the programs that we will use,
`dbgen` and `qgen`.
Copy `makefile.suite` to `makefile` and edit the content as below.

```
$ diff -u makefile.suite makefile
--- makefile.suite      2017-04-21 06:01:08.000000000 +0900
+++ makefile    2017-09-10 11:10:12.563384756 +0900
@@ -100,15 +100,15 @@
 ################
 ## CHANGE NAME OF ANSI COMPILER HERE
 ################
-CC      =
+CC      = gcc
 # Current values for DATABASE are: INFORMIX, DB2, TDAT (Teradata)
 #                                  SQLSERVER, SYBASE, ORACLE, VECTORWISE
 # Current values for MACHINE are:  ATT, DOS, HP, IBM, ICL, MVS,
 #                                  SGI, SUN, U2200, VMS, LINUX, WIN32
 # Current values for WORKLOAD are:  TPCH
-DATABASE=
-MACHINE =
-WORKLOAD =
+DATABASE= SQLSERVER
+MACHINE = LINUX
+WORKLOAD = TPCH
 #
 CFLAGS = -g -DDBNAME=\"dss\" -D$(MACHINE) -D$(DATABASE) -D$(WORKLOAD) -DRNG_TEST -D_FILE_OFFSET_BITS=64
 LDFLAGS = -O
```

Now, `$ make` command will build `dbgen` and `qgen`.

```
$ make

...

 bm_utils.o qgen.o rnd.o varsub.o text.o bcd2.o permute.o speed_seed.o rng64.o -lm
$ file dbgen
dbgen: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=d0bca1a18c33947d85f5943c8325837faec7c95d, not stripped
$ file qgen
qgen: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32, BuildID[sha1]=79a6216e04c446715b0e55f9c804586887b698c8, not stripped
```


TPC-H Toolkit Usage
===================

To run TPC-H on MariaDB, we need several more modification.
Before that, let's see how we run TPC-H using the files under `dbgen/`
directory.


Data Preparation
----------------

`dss.ddl` file has the sql statements be used for the creation of the 8 tables.
If you command your DB to execute the sql statements in this file, the 8 tables
will be created.

`dbgen` creates the sql statements that stores the data to the table.
If you run the `dbgen` with optional arguments including scale factor, 8 files
having `.tbl` suffix will be created.
Each of these files has query statements inserting the data to the table having
same name with the file.
You can store the data to the tables by making your DB to run the sql
statements.

`dss.ri` has a sql statement creating the table index.
Once your DB runs these sql statements, the table index will be generated and
you will be ready to run the TPC-H queries.


Query Creation and Execution
----------------------------

`qgen` creates the queries doing the TPC-H's analysis tasks.
We simply said 22 queries, but it would be better to say 22 kinds of queries.
If a query is repeatedly issued with same arguments, DB server can cache the
results and simply return it to the client.
As this can distort the results, TPC-H Toolkit has the template of the 22
queries under `dbgen/queries/` directory and let `qgen` to create query
statements using random arguments, based on this templates.
The seed for the random number generation is created based on `dists.dss` file.


Modify TPC-H Toolkit for MariaDB
================================

Each DBMS has a little bit different query syntax.
Thus, TPC-H Toolkit is made to support multiple DBMSes, but the MariaDB is not
in the supported DBMSes.
Therefore, you should modify a part of the TPC-H Toolkit to run TPC-H on the
MariaDB.

The files need modifications are `dss.ddl`, `dss.ri`, and the templates under
the `queries/` directory.
As the description of the each of the modifications will be too long, I simply
made patches for the modifications and uploaded on Github[5].
You can apply the patch files to your TPC-H Toolkit as below.
You should be on the TPC-H Toolkit source code directory while running below
command.

```
$ wget https://raw.githubusercontent.com/sjp38/tpch-mariadb/07fdcbfa9ba1be26f437ff130338a223d0dbfecd/0001-Modify-for-MariaDB.patch
$ patch -p1 < 0001-Modify-for-MariaDB.patch
```

The changes above includes the modification of the makefile.
After applying, build `dbgen` and `qgen`.


Data Creation
=============

Now, move to `dbgen/` directory and run `dbgen`.
You can give scale factor using its argument.
Refer to the usage of dbgen using `-h` option.
After its execution, you can see below 8 `.tbl` files.

```
dbgen$ ls -ahl *.tbl
-rw-rw-r-- 1 sjpark sjpark 187M Sep  9 10:48 customer.tbl
-rw-rw-r-- 1 sjpark sjpark 5.8G Sep  9 10:48 lineitem.tbl
-rw-rw-r-- 1 sjpark sjpark 2.2K Sep  9 10:48 nation.tbl
-rw-rw-r-- 1 sjpark sjpark 1.4G Sep  9 10:48 orders.tbl
-rw-rw-r-- 1 sjpark sjpark 919M Sep  9 10:48 partsupp.tbl
-rw-rw-r-- 1 sjpark sjpark 186M Sep  9 10:48 part.tbl
-rw-rw-r-- 1 sjpark sjpark  389 Sep  9 10:48 region.tbl
-rw-rw-r-- 1 sjpark sjpark  11M Sep  9 10:48 supplier.tbl
```

The above results used scale factor value as 8.


Load Data
=========

Now, with your MariaDB, create a database named tpch (line 1), create tables
under the database (line 2), load the data to the tables (lines 3-5), and make
index for each of the tables (line 6).

```
$ mysql -u root -p password -e "create database tpch;"
$ mysql -u root -p password < dss.ddl
$ for table in customer lineitem nation orders partsupp part region supplier \
	do mysql -u root -p -e \
		"LOAD DATA LOCAL INFILE '$table.tbl' FIELDS TERMINATED BY '|';"
	done
$ mysql -u root -p password < ./dss.ri
```


Create Queries
==============

Now, create the queries.
`qgen` receives a number from 1 to 22 which means the type of the queries to
create, generate the query statement, and print on the screen.
You can save the queries with below commands.
This example assumes it is executed on the `dbgen/` directory.

```
$ cd queries/
$ for i in {1..22}; do ../qgen $i > query-$i.sql; done
```

Now, you have 22 `query-` prefixed files containing each type of queries under
the `dbgen/queries/` directory.


Execute Queries
===============

As the query files have sql statement compatible with MariaDB, you can simply
run them as below.

```
$ for i in {1..22}; do mysql -u root -p password < dbgen/queries/query-$i.sql
```

Few queries will take few of tens of seconds to complete while another queries
take less than 1 second.


Conclusion
==========

This post summarised how TPC-H is constructed, how you can run it, and what
modifications are required to run it on MariaDB.
You can do this with only few lines of command based on the automated scripts
on my Github repo[6].


References
==========

[1] http://datawarehouse4u.info/OLTP-vs-OLAP.html  
[2] http://www.tpc.org/tpch/  
[3] http://www.tpc.org/tpc_documents_current_versions/pdf/tpc-h_v2.17.2.pdf  
[4] http://www.tpc.org/tpc_documents_current_versions/download_programs/tools-download-request.asp?bm_type=TPC-H&bm_vers=2.17.2&mode=CURRENT-ONLY  
[5] https://raw.githubusercontent.com/sjp38/tpch-mariadb/07fdcbfa9ba1be26f437ff130338a223d0dbfecd/0001-Modify-for-MariaDB.patch  
[6] https://github.com/sjp38/tpch-mariadb
