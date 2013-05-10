CVC4
=========================

Introduction
-------------
CVC4, the fifth generation of Cooperating Validity Checker from NYU and U Iowa, is a DPLL solver with a SAT solver core and a delegation path to different decision procedure implementations, each in charge of solving formulas in some background theory. It works for first-order logics. It has implemented decision procedures for the theory of uninterpreted/free functions, arithmetic(integer, real, linear, non-linear), arrays, bit-vectors and datatypes. It uses a combination method based on Nelson-Oppen to cooperate different theories. Also, CVC4 supports quantifiers through heuristic instantiaion\footnote and has the ability to generate model. For both satisfiable(sat)/unsatisfiable(unsat) formulas, CVC4 can come up with the correct answer.


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


Kinds of Expressions 
----------------------

From Built-in Theory
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

=============================   ================================================================================================
Kind                            Meaning
=============================   ================================================================================================
SORT_TAG                        sort tag
SORT_TYPE                       sort type                              
UNINTERPRETED_CONSTANT          The kind of expressions representing uninterpreted constants
ABSTRACT_VALUE                  The kind of expressions representing abstract values (other than uninterpreted sort constant
BUILTIN                         The kind of expressions representing built-in operators
FUNCTION                        function
APPLY                           defined function application
EQUAL                           equality
DISTINCT                        disequality
VARIABLE                        variable
BOUND_VARIABLE                  bound variable
SKOLEM                          skolem var
SEXPR                           a symbolic expression
LAMBDA                          lambda
CHAIN                           chain operator                             
TYPE_CONSTANT                   basic types
FUNCTION_TYPE                   function type
SEXPR_TYPE                      symbolic expression type
CONST_STRING                    a string of characters
SUBTYPE_TYPE                    predicate subtype
=============================   ================================================================================================



From Boolean Theory
^^^^^^^^^^^^^^^^^^^
=============  =====================
Kind           Meaning
=============  =====================
CONST_BOOLEAN  truth and falsity 
NOT            logical not 
AND            logical and 
IFF            logical equivalence 
IMPLIES        logical implication 
OR             logical or 
XOR            exclusive or 
ITE            if-then-else 
=============  =====================


From UF Theory
^^^^^^^^^^^^^^^^^^^^

======================  ============
Kind                    Meaning
======================  ============
APPLY_UF                uninterpreted function application 
CARDINALITY_CONSTRAINT  cardinality constraint 
======================  ============


From Arithmatic Theory
^^^^^^^^^^^^^^^^^^^^^^^

==================== =================
Kind                 Meaning
==================== =================
PLUS                 arithmetic addition 
MULT                 arithmetic multiplication 
MINUS                arithmetic binary subtraction operator 
UMINUS               arithmetic unary negation 
DIVISION             real division (user symbol) 
DIVISION_TOTAL       real division with interpreted division by 0 (internal symbol) 
INTS_DIVISION        ints division (user symbol) 
INTS_DIVISION_TOTAL  ints division with interpreted division by 0 (internal symbol) 
INTS_MODULUS         ints modulus (user symbol) 
INTS_MODULUS_TOTAL   ints modulus with interpreted division by 0 (internal symbol) 
POW                  arithmetic power 
SUBRANGE_TYPE        the type of an integer subrange 
CONST_RATIONAL       a multiple-precision rational constant 
LT                   less than, x < y 
LEQ                  less than or equal, x <= y 
GT                   greater than, x > y 
GEQ                  greater than or equal, x >= y 
==================== =================


From Array Theory
^^^^^^^^^^^^^^^^^^^^^

===============      ==========
Kind                 Meaning
===============      ==========
ARRAY_TYPE           array type 
SELECT               array select 
STORE                array store 
STORE_ALL            array store-all 
ARR_TABLE_FUN        array table function (internal symbol) 
===============      ==========


From BitVector Theory
^^^^^^^^^^^^^^^^^^^^^^

=========================  ================================================================================================================
Kind                       Meaning
=========================  ================================================================================================================
BITVECTOR_TYPE             bit-vector type 
CONST_BITVECTOR            a fixed-width bit-vector constant 
BITVECTOR_CONCAT           bit-vector concatenation 
BITVECTOR_AND              bitwise and 
BITVECTOR_OR               bitwise or 
BITVECTOR_XOR              bitwise xor 
BITVECTOR_NOT              bitwise not 
BITVECTOR_NAND             bitwise nand 
BITVECTOR_NOR              bitwise nor 
BITVECTOR_XNOR             bitwise xnor 
BITVECTOR_COMP             equality comparison (returns one bit) 
BITVECTOR_MULT             bit-vector multiplication 
BITVECTOR_PLUS             bit-vector addition 
BITVECTOR_SUB              bit-vector subtraction 
BITVECTOR_NEG              bit-vector unary negation 
BITVECTOR_UDIV             bit-vector unsigned division, truncating towards 0 (undefined if divisor is 0) 
BITVECTOR_UREM             bit-vector unsigned remainder from truncating division (undefined if divisor is 0) 
BITVECTOR_SDIV             bit-vector 2's complement signed division 
BITVECTOR_SREM             bit-vector 2's complement signed remainder (sign follows dividend) 
BITVECTOR_SMOD             bit-vector 2's complement signed remainder (sign follows divisor) 
BITVECTOR_UDIV_TOTAL       bit-vector total unsigned division, truncating towards 0 (undefined if divisor is 0) 
BITVECTOR_UREM_TOTAL       bit-vector total unsigned remainder from truncating division (undefined if divisor is 0) 
BITVECTOR_SHL              bit-vector left shift 
BITVECTOR_LSHR             bit-vector logical shift right 
BITVECTOR_ASHR             bit-vector arithmetic shift right 
BITVECTOR_ULT              bit-vector unsigned less than 
BITVECTOR_ULE              bit-vector unsigned less than or equal 
BITVECTOR_UGT              bit-vector unsigned greater than 
BITVECTOR_UGE              bit-vector unsigned greater than or equal 
BITVECTOR_SLT              bit-vector signed less than 
BITVECTOR_SLE              bit-vector signed less than or equal 
BITVECTOR_SGT              bit-vector signed greater than 
BITVECTOR_SGE              bit-vector signed greater than or equal 
BITVECTOR_BITOF_OP         operator for the bit-vector boolean bit extract 
BITVECTOR_EXTRACT_OP       operator for the bit-vector extract 
BITVECTOR_REPEAT_OP        operator for the bit-vector repeat 
BITVECTOR_ZERO_EXTEND_OP   operator for the bit-vector zero-extend 
BITVECTOR_SIGN_EXTEND_OP   operator for the bit-vector sign-extend 
BITVECTOR_ROTATE_LEFT_OP   operator for the bit-vector rotate left 
BITVECTOR_ROTATE_RIGHT_OP  operator for the bit-vector rotate right 
BITVECTOR_BITOF            bit-vector boolean bit extract 
BITVECTOR_EXTRACT          bit-vector extract 
BITVECTOR_REPEAT           bit-vector repeat 
BITVECTOR_ZERO_EXTEND      bit-vector zero-extend 
BITVECTOR_SIGN_EXTEND      bit-vector sign-extend 
BITVECTOR_ROTATE_LEFT      bit-vector rotate left 
BITVECTOR_ROTATE_RIGHT     bit-vector rotate right 
=========================  ================================================================================================================


From Datatype Theory
^^^^^^^^^^^^^^^^^^^^^^^^

====================== =========
Kind                   Meaning
====================== =========
CONSTRUCTOR_TYPE       constructor 
SELECTOR_TYPE          selector 
TESTER_TYPE            tester 
APPLY_CONSTRUCTOR      constructor application 
APPLY_SELECTOR         selector application 
APPLY_TESTER           tester application 
DATATYPE_TYPE          datatype type 
PARAMETRIC_DATATYPE    parametric datatype 
APPLY_TYPE_ASCRIPTION  type ascription, for datatype constructor applications 
ASCRIPTION_TYPE        a type parameter for type ascription 
TUPLE_TYPE             tuple type 
TUPLE                  a tuple 
TUPLE_SELECT_OP        operator for a tuple select 
TUPLE_SELECT           tuple select 
TUPLE_UPDATE_OP        operator for a tuple update 
TUPLE_UPDATE           tuple update 
RECORD_TYPE            record type 
RECORD                 a record 
RECORD_SELECT_OP       operator for a record select 
RECORD_SELECT          record select 
RECORD_UPDATE_OP       operator for a record update 
RECORD_UPDATE          record update 
====================== =========


From Quantifier Theory
^^^^^^^^^^^^^^^^^^^^^^^^^^
===================== ================
Kind                  Meaning
===================== ================
FORALL                universally quantified formula 
EXISTS                existentially quantified formula 
INST_CONSTANT         instantiation constant 
BOUND_VAR_LIST        bound variables 
INST_PATTERN          instantiation pattern 
INST_PATTERN_LIST     instantiation pattern list 
===================== ================


From RewriteRule Theory
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

=============       ============
Kind                Meaning
=============       ============
REWRITE_RULE        generale rewrite rule 
RR_REWRITE          actual rewrite rule 
RR_REDUCTION        actual reduction rule 
RR_DEDUCTION        actual deduction rule 
=============       ============


Built-in Atomic Types
------------------------

=======================  =============
Type                     Meaning
=======================  =============
BUILTIN_OPERATOR_TYPE    Built in type for built in operators 
STRING_TYPE              String type 
BOOLEAN_TYPE             Boolean type 
REAL_TYPE                Real type 
INTEGER_TYPE             Integer type 
BOUND_VAR_LIST_TYPE      Bound Var type 
INST_PATTERN_TYPE        Instantiation pattern type 
INST_PATTERN_LIST_TYPE   Instantiation pattern list type 
RRHB_TYPE                head and body of the rule type 
=======================  =============


Theories
--------------------

===================== ============ 
ID                    Meaning
===================== ============
THEORY_BUILTIN
THEORY_BOOL
THEORY_UF
THEORY_ARITH
THEORY_ARRAY
THEORY_BV
THEORY_DATATYPES
THEORY_QUANTIFIERS
THEORY_REWRITERULES
===================== ============  



