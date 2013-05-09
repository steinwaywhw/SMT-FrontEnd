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