AltErgo
==========================

Introduction
--------------
Alt-Ergo is dedicated to program verification. It works in first-order logic. It uses a CC(X), a variant of Shostak algorithm, to combine free theory with equality and an arbitrary solvable built-in theory X. Alt-Ergo has implemented decision procedures for the theory of uninterpreted/free functions, arithmetic(integer, real, linear, non-linear), arrays, bit-vectors, datatypes, etc. It also has direct support for polymorphism in its native input language. Associative and commutative symbols are being handled specially using its AC(X) theory to boost the performance. It has limited support for universal and existential quantifiers through instantiation. It has the ability to generate proof. Alt-Ergo can handle unsat formulas correctly, but only returns unknown for sat formulas.

Since integer theory is intensively used in program verification, Alt-Ergo puts its efforts in the combination of empty/free theory with integer arithmetic theory. Alt-Ergo uses a Simplex-based extension of Fourier-Motzkin for solving linear integer arithmetic.



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