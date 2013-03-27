CVC4
=========================

Building
-----------

Since ANTLR has been largely changed, the building process listed `here <http://church.cims.nyu.edu/wiki/User_Manual#Building_CVC4_from_source>`_ should be changed a little bit.

#. Download source code from official `links <http://cvc4.cs.nyu.edu/builds/src/>`_.
#. Following the `building instruction <http://church.cims.nyu.edu/wiki/User_Manual#Building_CVC4_from_source>`_ to build the CVC4.
#. Enter ``contrib`` directory, use ``get-antlr-3.4`` to get ANTLR.

	.. note:: The ``get-antlr-3.4`` file should be changed.
		All the hyperlinks including "**antlr.org**" should be changed to "**antlr3.org**".

#. Use ``./configure --with-antlr-dir=`pwd`/antlr-3.4 ANTLR=`pwd`/antlr-3.4/bin/antlr3`` to do configuration.
#. Following the rest steps in the building instruction. If the ``configure`` reports missing something, just install them all.
#. Make

Using
-----------
 
To invoke command line interface, just type ::
	
	./cvc4 scriptfile.smt2

It will use the correct parser based on file extensions. If you want to test all the scripts in a folder, try this ::
	
	ls | xargs -n 1 cvc4




AltErgo
==========================

Building
----------

It depends largely on OCaml, so during configuration and making, if they report missing something, google that and install related packages. Most of them are OCaml related, and try to google ``ocamlfind``, ``ocaml-core``, ``typeconv`` for more information.

Using
-------

To invoke command line interface, just type ::

	./alt-ergo.opt scriptfile.smt2

to execute a SMT-LIB v2.0 script file. AltErgo will convert it into its native language, and then execute it. The result will be printed on the standard output.

To invoke GUI, just type ::
	
	./altgr-ergo.opt scriptfile.smt2

to open it. If the file is successfully parsed and translated, then the GUI will open. Otherwise, it exits.

.. note:: It may take a very long time for either way to process the whole script file.