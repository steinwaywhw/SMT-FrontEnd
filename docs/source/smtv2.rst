The SMT-LIB Language
========================

The SMT-LIB Language uses *S-expression*, which is actually legal Common Lisp syntax. It has three main components: *theory declarations*, *logic declarations*, and *scripts*.

They contain only ASCII characters, not Unicode.

The followings are a preview of the ANTLR v4 grammar of SMTLIB v2.0 by Hanwen Wu, according to [BaST10]_. (And, subject to change.)


A Summary of SMT-LIB Logic 2.0
---------------------------------

We are working on integrating two SMT solvers, therefore it is necessary to understand the SMT-LIB 2.0 logic, which can be used as an input language for both solvers (`AltErgo <http://alt-ergo.lri.fr/>`_, `CVC4 <http://cvc4.cs.nyu.edu/web/>`_). Part of the project is to classify formulas which can be solved by one solver, while not by the others. Therefore knowing how theories and logics are defined in SMT-LIB is also important.

SMT-LIB Logics
^^^^^^^^^^^^^^^^^^^

* :math:`\mathcal{S}`: Infinite set of sort symbols, containing BOOL.
* :math:`\mathcal{V}`: Infinite set of sort parameters
* :math:`\mathcal{X}`: Infinite set of variables
* :math:`\mathcal{F}`: Infinite set of function symbols
* :math:`\mathcal{B}`: Boolean values {true, false}
* ...

Sorts
^^^^^^^^

Sorts over a set of sort symbols :math:`\mathcal{S}` are defined as *Sort* (:math:`\mathcal{S}`).

* :math:`\sigma \in \mathcal{S}` of arity 0 is a sort
* :math:`\sigma \sigma_1,\sigma_2,\sigma_3,...,\sigma_n` is a sort if :math:`\sigma \in \mathcal{S}` of arity :math:`n`, :math:`\sigma_1` to :math:`\sigma_n` are sorts

Signature
^^^^^^^^^^^^^

Baiscly, :math:`\Sigma` defines sort symbols and arities, function symbols and ranks, some variables and their sorts.

* :math:`\Sigma^{\mathcal{S}} \subset \mathcal{S}`: sort symbols, containing BOOL
* :math:`\Sigma^{\mathcal{F}} \subset \mathcal{F}`: function symbols, containing equality, conjunction, and negation
* :math:`\Sigma^{\mathcal{S}}` to :math:`\mathbb{ℕ}`: a total mapping from sort symbol to its arity, including *𝙱𝙾𝙾𝙻* :math:`\models` 𝟶
* :math:`\Sigma^{\mathcal{F}}` to *Sort* (:math:`\Sigma^{\mathcal{S}}`)+: a left total mapping from a function symbol to its rank, containing = (:math:`\sigma,\sigma` ,BOOL), :math:`\neg` (BOOL,BOOL), :math:`\land` (BOOL,BOOL,BOOL).
* :math:`\mathcal{X}` to *Sort* (:math:`\Sigma^{\mathcal{S}}`): a partial mapping from a variable to its sort.

Formulas
^^^^^^^^^^^

Well sorted terms of sort BOOL over :math:`\Sigma`.

Structure
^^^^^^^^^^^^^^^

A can be regarded as a model.

* :math:`A`: the universe (of values) of A, including *BOOL* :math:`^{A}` ={true,false}.
* :math:`\sigma^{A} \subset A`: give the sort :math:`\sigma \in` *Sort* (:math:`\Sigma^{\mathcal{S}}`) a universe :math:`\sigma^{A} \subset A`. For example, *BOOL* :math:`^{A}` is {true,flase} :math:`\in A`. *INT* :math:`^{A}` could be all the integers :math:`\mathbb{Z} \in A`.
* :math:`(f:\sigma) A \in \sigma^{A}`: give the constant symbol :math:`f:σ` a value in the universe of :math:`\sigma`
* :math:`(f:\sigma_1,\sigma_2,...,\sigma_n,\sigma)^{A}`: define the function symbol as a relation from :math:`(\sigma_1,\sigma_2,...,\sigma_n)^{A}` to :math:`\sigma^{A}`. This must include the equality relations (or identity predicate over :math:`\sigma^A`, that is =(:math:`\sigma,\sigma`,BOOL) as standard equality relations from (:math:`\sigma^{A},\sigma^{A}`) to {true,false}).

:math:`\sigma^{A}` is called the extension of :math:`\sigma` in :math:`A`.

Valuation and Interpretation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

* Valuations :math:`v`: a partial mapping :math:`v` from :math:`\mathcal{X} \times` *Sort* :math:`(\Sigma^{\mathcal{S}})` to :math:`\sigma^{A}`. That is to give variable :math:`x` of sort :math:`\sigma` a value in :math:`\sigma^{A}`.
* Interpretation :math:`\mathcal{I}: \mathcal{I}=(A,v)`, that is the structure together with the valuations make the :math:`\Sigma`-interpretation.
* Semantics: :math:`\mathcal{I}` will assign a meaning to well-sorted terms by uniquely mapping them into the :math:`A`.
* Satisfiability:
    * If :math:`\varphi` is mapped to true by some :math:`\mathcal{I}`, then it is satisfiable.
    * If :math:`\varphi` is not closed, we say :math:`\mathcal{I}=(A,v)` makes true :math:`\varphi`.
    * If :math:`\varphi` is closed, we say the structure :math:`A` makes true :math:`\varphi`.(Since it does not matter what valuation it is.)
    * If :math:`\varphi` is closed, we say the structure :math:`A` a model of :math:`\varphi`.

Theories
^^^^^^^^^^^


* Traditionally, its a set of axioms
* Here it consists of three parts

    * Signature: :math:`\Sigma`
    * Axioms:
        We think this part is left for the people who implement solvers. Take INT theory as an example, since we have the plus sign in our signature (we just denote it as ADD, so that you know it is only a symbol, not the actual operation), we will have an axiom like ∀x:𝙸𝙽𝚃.y:𝙸𝙽𝚃.∃z:𝙸𝙽𝚃.𝙰𝙳𝙳(x,y,z)↔x+y=z. Therefore, our model (or structure) must contain the correct relations to map 𝙰𝙳𝙳 to the actual addition operation to satisfy this axiom.

        Also, some theories like REAL include those axioms as plain text, like associativity, commutativity, etc.
    * Models: A set of :math:`\Sigma`-structures, all of which are models of the theory.

Logics
^^^^^^^^^^

* Sublogic: it is a sublogic of SMT-LIB logic
* Restrictions:
    * fixing a signature :math:`\Sigma` and its theory :math:`\mathcal{T}`
    * restricting structures to the models of :math:`\mathcal{T}`
    * restricting input sentences as subset of :math:`\Sigma`-sentences


Lexer Rules
--------------

.. code-block:: antlr

    // Predefined Symbols
    SYM_BOOL                : 'Bool';
    SYM_CONTINUED_EXECUTION : 'continued-execution';
    SYM_ERROR               : 'error';
    SYM_FALSE               : 'false';
    SYM_IMMEDIATE_EXIT      : 'immediate-exit';
    SYM_INCOMPLETE          : 'incomplete';
    SYM_LOGIC               : 'logic';
    SYM_MEMOUT              : 'memout';
    SYM_SAT                 : 'sat';
    SYM_SUCCESS             : 'success';
    SYM_THEORY              : 'theory';
    SYM_TRUE                : 'true';
    SYM_UNKNOWN             : 'unknown';
    SYM_UNSAT               : 'unsat';
    SYM_UNSUPPORTED         : 'unsupported';

    // Predefined Keywords
    KEYWORD_ALL_STATISTICS              : ':all-statistics';
    KEYWORD_AUTHORS                     : ':authors';
    KEYWORD_AXIOMS                      : ':axioms';
    KEYWORD_CHAINABLE                   : ':chainable';
    KEYWORD_DEFINITION                  : ':definition';
    KEYWORD_DIAGNOSTIC_OUTPUT_CHANNEL   : ':diagnostic-output-channel';
    KEYWORD_ERROR_BEHAVIOR              : ':error-behavior';
    KEYWORD_EXPAND_DEFINITIONS          : ':expand-definitions';
    KEYWORD_EXTENSIONS                  : ':extensions';
    KEYWORD_FUNS                        : ':funs';
    KEYWORD_FUNS_DESCRIPTION            : ':funs-description';
    KEYWORD_INTERACTIVE_MODE            : ':interactive-mode';
    KEYWORD_LANGUAGE                    : ':language';
    KEYWORD_LEFT_ASSOC                  : ':left-assoc';
    KEYWORD_NAME                        : ':name';
    KEYWORD_NAMED                       : ':named';
    KEYWORD_NOTES                       : ':notes';
    KEYWORD_PRINT_SUCCESS               : ':print-success';
    KEYWORD_PRODUCE_ASSIGNMENTS         : ':produce-assignments';
    KEYWORD_PRODUCE_MODELS              : ':produce-models';
    KEYWORD_PRODUCE_PROOFS              : ':produce-proofs';
    KEYWORD_PRODUCE_UNSAT_CORES         : ':produce-unsat-cores';
    KEYWORD_RANDOM_SEED                 : ':random-seed';
    KEYWORD_REASON_UNKNOWN              : ':reason-unknown';
    KEYWORD_REGULAR_OUTPUT_CHANNEL      : ':regular-output-channel';
    KEYWORD_RIGHT_ASSOC                 : ':right-assoc';
    KEYWORD_SORTS                       : ':sorts';
    KEYWORD_SORTS_DESCRIPTION           : ':sorts-description';
    KEYWORD_STATUS                      : ':status';
    KEYWORD_THEORIES                    : ':theories';
    KEYWORD_VALUES                      : ':values';
    KEYWORD_VERBOSITY                   : ':verbosity';
    KEYWORD_VERSION                     : ':version';

    // Predifined General Token
    TOKEN_BANG       : '!';
    TOKEN_UNDERSCORE : '_';
    TOKEN_AS         : 'as';
    TOKEN_DECIMAL    : 'DECIMAL';
    TOKEN_EXISTS     : 'exists';
    TOKEN_FORALL     : 'forall';
    TOKEN_LET        : 'let';
    TOKEN_NUMERAL    : 'NUMERAL';
    TOKEN_PAR        : 'par';
    TOKEN_STRING     : 'STRING';

    // Predefined Command Token
    TOKEN_CMD_ASSERT          : 'assert';
    TOKEN_CMD_CHECK_SAT       : 'check-sat';
    TOKEN_CMD_DECLARE_SORT    : 'declare-sort';
    TOKEN_CMD_DECLARE_FUN     : 'declare-fun';
    TOKEN_CMD_DEFINE_SORT     : 'define-sort';
    TOKEN_CMD_DEFINE_FUN      : 'define-fun';
    TOKEN_CMD_EXIT            : 'exit';
    TOKEN_CMD_GET_ASSERTIONS  : 'get-assertions';
    TOKEN_CMD_GET_ASSIGNMENT  : 'get-assignment';
    TOKEN_CMD_GET_INFO        : 'get-info';
    TOKEN_CMD_GET_OPTION      : 'get-option';
    TOKEN_CMD_GET_PROOF       : 'get-proof';
    TOKEN_CMD_GET_UNSAT_CORE  : 'get-unsat-core';
    TOKEN_CMD_GET_VALUE       : 'get-value';
    TOKEN_CMD_POP             : 'pop';
    TOKEN_CMD_PUSH            : 'push';
    TOKEN_CMD_SET_LOGIC       : 'set-logic';
    TOKEN_CMD_SET_INFO        : 'set-info';
    TOKEN_CMD_SET_OPTION      : 'set-option';

    fragment DIGIT      : [0-9];
    fragment HEXDIGIT   : DIGIT | [a-fA-F];
    fragment ALPHA      : [a-zA-Z];
    fragment ESCAPE     : '\\' ('\\' | '"');
    fragment SYM_CHAR   : [+-/*=%?!.$_~&^<>@];

    NUMERAL       : '0' | [1-9] DIGIT*;
    DECIMAL       : NUMERAL '.' [0]* NUMERAL;
    HEXADECIMAL   : '#x' HEXDIGIT+;
    BINARY        : '#b' [01]+;
    STRING        : '"' (ESCAPE | ~('\\' | '"')*) '"';
    WS            : [\t\r\n\f ]+ {skip();};
    SIMPLE_SYM    : (ALPHA | SYM_CHAR) (DIGIT | ALPHA | SYM_CHAR)*;
    QUOTED_SYM    : '|' ~('|' | '\\')* '|';
    COMMENT       : ';' ~('\n' | '\r')* {skip();};
    KEYWORD_TOKEN : ':' (ALPHA | DIGIT | SYM_CHAR)+;



Parser Rules
--------------

.. code-block:: antlr


    symbol      : SIMPLE_SYM 
                | QUOTED_SYM
                | SYM_BOOL
                | SYM_CONTINUED_EXECUTION
                | SYM_ERROR
                | SYM_FALSE
                | SYM_IMMEDIATE_EXIT
                | SYM_INCOMPLETE
                | SYM_LOGIC
                | SYM_MEMOUT
                | SYM_SAT
                | SYM_SUCCESS
                | SYM_THEORY
                | SYM_TRUE
                | SYM_UNKNOWN
                | SYM_UNSAT
                | SYM_UNSUPPORTED
                ;

    keyword     : KEYWORD_TOKEN
                | KEYWORD_ALL_STATISTICS
                | KEYWORD_AUTHORS
                | KEYWORD_AXIOMS
                | KEYWORD_CHAINABLE
                | KEYWORD_DEFINITION
                | KEYWORD_DIAGNOSTIC_OUTPUT_CHANNEL
                | KEYWORD_ERROR_BEHAVIOR
                | KEYWORD_EXPAND_DEFINITIONS
                | KEYWORD_EXTENSIONS
                | KEYWORD_FUNS
                | KEYWORD_FUNS_DESCRIPTION
                | KEYWORD_INTERACTIVE_MODE
                | KEYWORD_LANGUAGE
                | KEYWORD_LEFT_ASSOC
                | KEYWORD_NAME
                | KEYWORD_NAMED
                | KEYWORD_NOTES
                | KEYWORD_PRINT_SUCCESS
                | KEYWORD_PRODUCE_ASSIGNMENTS
                | KEYWORD_PRODUCE_MODELS
                | KEYWORD_PRODUCE_PROOFS
                | KEYWORD_PRODUCE_UNSAT_CORES
                | KEYWORD_RANDOM_SEED
                | KEYWORD_REASON_UNKNOWN
                | KEYWORD_REGULAR_OUTPUT_CHANNEL
                | KEYWORD_RIGHT_ASSOC
                | KEYWORD_SORTS
                | KEYWORD_SORTS_DESCRIPTION
                | KEYWORD_STATUS
                | KEYWORD_THEORIES
                | KEYWORD_VALUES
                | KEYWORD_VERBOSITY
                | KEYWORD_VERSION
                ;

    spec_constant   : NUMERAL | DECIMAL | HEXADECIMAL | BINARY | STRING;
    s_expr          : spec_constant | symbol | keyword | '(' s_expr* ')';
                                                      
    identifier      : symbol | '(' TOKEN_UNDERSCORE symbol NUMERAL+ ')';
    sort            : identifier | '(' identifier sort+ ')';
    attribute_value : symbol | spec_constant | '(' s_expr* ')';
    attribute       : keyword | keyword attribute_value;

    qual_identifier : identifier | '(' TOKEN_AS identifier sort ')';
    var_binding     : '(' symbol term ')';
    sorted_var      : '(' symbol sort ')';
    term           
        : spec_constant
        | qual_identifier
        | '(' qual_identifier term+ ')'
        | '(' TOKEN_LET '(' var_binding+ ')' term ')'
        | '(' TOKEN_FORALL '(' sorted_var+ ')' term ')'
        | '(' TOKEN_EXISTS '(' sorted_var+ ')' term ')'
        | '(' TOKEN_BANG term attribute+ ')'
        ;
                   
    sort_symbol_decl    : '(' identifier NUMERAL attribute* ')';
    meta_spec_constant  : TOKEN_NUMERAL | TOKEN_DECIMAL | TOKEN_STRING;
    fun_symbol_decl     
        : '(' spec_constant sort attribute* ')'
        | '(' meta_spec_constant sort attribute* ')'
        | '(' identifier sort+ attribute* ')'
        ;
    par_fun_symbol_decl 
        : fun_symbol_decl
        | '(' TOKEN_PAR '(' symbol+ ')' '(' identifier sort+ attribute* ')' ')'
        ;

    theory_decl : '(' SYM_THEORY symbol? theory_attribute+ ')';

    theory_attribute
        : KEYWORD_SORTS '(' sort_symbol_decl+ ')'
        | KEYWORD_FUNS '(' par_fun_symbol_decl+ ')'
        | KEYWORD_SORTS_DESCRIPTION STRING
        | KEYWORD_FUNS_DESCRIPTION STRING
        | KEYWORD_DEFINITION STRING
        | KEYWORD_VALUES STRING
        | KEYWORD_NOTES STRING
        | attribute
        ;
                
    logic_attribute 
        : KEYWORD_THEORIES '(' symbol+ ')'
        | KEYWORD_LANGUAGE STRING
        | KEYWORD_EXTENSIONS STRING
        | KEYWORD_VALUES STRING
        | KEYWORD_NOTES STRING
        | attribute
        ;
                
    logic   : '(' SYM_LOGIC symbol logic_attribute+ ')';

    b_value : SYM_TRUE | SYM_FALSE;
    option 
        : KEYWORD_PRINT_SUCCESS b_value
        | KEYWORD_EXPAND_DEFINITIONS b_value
        | KEYWORD_INTERACTIVE_MODE b_value
        | KEYWORD_PRODUCE_PROOFS b_value
        | KEYWORD_PRODUCE_UNSAT_CORES b_value
        | KEYWORD_PRODUCE_MODELS b_value
        | KEYWORD_PRODUCE_ASSIGNMENTS b_value
        | KEYWORD_REGULAR_OUTPUT_CHANNEL STRING
        | KEYWORD_DIAGNOSTIC_OUTPUT_CHANNEL STRING
        | KEYWORD_RANDOM_SEED NUMERAL
        | KEYWORD_VERBOSITY NUMERAL
        | attribute
        ;

    info_flag 
        : KEYWORD_ERROR_BEHAVIOR
        | KEYWORD_NAME
        | KEYWORD_AUTHORS
        | KEYWORD_VERSION
        | KEYWORD_STATUS
        | KEYWORD_REASON_UNKNOWN
        | keyword
        | KEYWORD_ALL_STATISTICS
        ;
          
    command
        : '(' TOKEN_CMD_SET_LOGIC symbol ')'
        | '(' TOKEN_CMD_SET_OPTION option ')'
        | '(' TOKEN_CMD_SET_INFO attribute ')'
        | '(' TOKEN_CMD_DECLARE_SORT symbol NUMERAL ')'
        | '(' TOKEN_CMD_DEFINE_SORT symbol '(' symbol* ')' sort ')'
        | '(' TOKEN_CMD_DECLARE_FUN symbol '(' sort* ')' sort ')'
        | '(' TOKEN_CMD_DEFINE_FUN symbol '(' sorted_var* ')' sort term ')'
        | '(' TOKEN_CMD_PUSH NUMERAL ')'
        | '(' TOKEN_CMD_POP NUMERAL ')'
        | '(' TOKEN_CMD_ASSERT term ')'
        | '(' TOKEN_CMD_CHECK_SAT ')'
        | '(' TOKEN_CMD_GET_ASSERTIONS ')'
        | '(' TOKEN_CMD_GET_PROOF ')'
        | '(' TOKEN_CMD_GET_UNSAT_CORE ')'
        | '(' TOKEN_CMD_GET_VALUE '(' term+ ')' ')'
        | '(' TOKEN_CMD_GET_ASSIGNMENT ')'
        | '(' TOKEN_CMD_GET_OPTION keyword ')'
        | '(' TOKEN_CMD_GET_INFO info_flag ')'
        | '(' TOKEN_CMD_EXIT ')'
        ;

    script : command+;

    gen_response    : SYM_UNSUPPORTED | SYM_SUCCESS | '(' SYM_ERROR STRING ')';
    error_behavior  : SYM_IMMEDIATE_EXIT | SYM_CONTINUED_EXECUTION;
    reason_unknown  : SYM_MEMOUT | SYM_INCOMPLETE;
    status          : SYM_SAT | SYM_UNSAT | SYM_UNKNOWN;
    info_response   
        : KEYWORD_ERROR_BEHAVIOR error_behavior
        | KEYWORD_NAME STRING
        | KEYWORD_AUTHORS STRING
        | KEYWORD_VERSION STRING
        | KEYWORD_REASON_UNKNOWN reason_unknown
        | attribute
        ;

    get_info_response       : '(' info_response+ ')';
    check_sat_response      : status;
    get_assertions_response : '(' term+ ')';
    proof                   : s_expr;
    get_proof_response      : proof;
    get_unsat_core_response : '(' symbol+ ')';
    valuation_pair          : '(' term term ')';
    get_value_response      : '(' valuation_pair+ ')';
    t_valuation_pair        : '(' symbol b_value ')';
    get_assignment_response : '(' t_valuation_pair* ')';
    get_option_response     : attribute_value;


Examples
-------------

Script File
--------------