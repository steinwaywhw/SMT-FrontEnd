The SMT-LIB Language
========================

The SMT-LIB Language uses *S-expression*, which is actually legal Common Lisp syntax. It has three main components: *theory declarations*, *logic declarations*, and *scripts*.

They contain only ASCII characters, not Unicode.

Lexicon
------------

.. productionlist::
   try_stmt: try1_stmt | try2_stmt
   try1_stmt: "try" ":" `suite`
            : ("except" [`expression` ["," `target`]] ":" `suite`)+
            : ["else" ":" `suite`]
            : ["finally" ":" `suite`]
   try2_stmt: "try" ":" `suite`
            : "finally" ":" `suite`