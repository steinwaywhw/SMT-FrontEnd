/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

grammar SmtLib;

/*
 * Terminals, and keywords
 */

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

specConstant   : NUMERAL | DECIMAL | HEXADECIMAL | BINARY | STRING;
sExpr          : specConstant | symbol | keyword | '(' sExpr* ')';
                                                  
identifier      : symbol | '(' TOKEN_UNDERSCORE symbol NUMERAL+ ')';
sort            : identifier | '(' identifier sort+ ')';
attributeValue : symbol | specConstant | '(' sExpr* ')';
attribute       : keyword | keyword attributeValue;

qualIdentifier : identifier | '(' TOKEN_AS identifier sort ')';
varBinding     : '(' symbol term ')';
sortedVar      : '(' symbol sort ')';
term           
    : specConstant                                     # TermConstant
    | qualIdentifier                                   # TermVariable
    | '(' qualIdentifier term+ ')'                     # TermFunction
    | '(' TOKEN_LET '(' varBinding+ ')' term ')'       # TermBinderLet
    | '(' TOKEN_FORALL '(' sortedVar+ ')' term ')'     # TermBinderForAll
    | '(' TOKEN_EXISTS '(' sortedVar+ ')' term ')'     # TermBinderExists
    | '(' TOKEN_BANG term attribute+ ')'               # TermAnnotation
    ;
               
sortSymbolDecl    : '(' identifier NUMERAL attribute* ')';
metaSpecConstant  : TOKEN_NUMERAL | TOKEN_DECIMAL | TOKEN_STRING;
funSymbolDecl     
    : '(' specConstant sort attribute* ')'
    | '(' metaSpecConstant sort attribute* ')'
    | '(' identifier sort+ attribute* ')'
    ;
parFunSymbolDecl 
    : funSymbolDecl
    | '(' TOKEN_PAR '(' symbol+ ')' '(' identifier sort+ attribute* ')' ')'
    ;

theoryDecl : '(' SYM_THEORY symbol? theoryAttribute+ ')';

theoryAttribute
    : KEYWORD_SORTS '(' sortSymbolDecl+ ')'
    | KEYWORD_FUNS '(' parFunSymbolDecl+ ')'
    | KEYWORD_SORTS_DESCRIPTION STRING
    | KEYWORD_FUNS_DESCRIPTION STRING
    | KEYWORD_DEFINITION STRING
    | KEYWORD_VALUES STRING
    | KEYWORD_NOTES STRING
    | attribute
    ;

logicAttribute 
    : KEYWORD_THEORIES '(' symbol+ ')'
    | KEYWORD_LANGUAGE STRING
    | KEYWORD_EXTENSIONS STRING
    | KEYWORD_VALUES STRING
    | KEYWORD_NOTES STRING
    | attribute
    ;
logic   : '(' SYM_LOGIC symbol logicAttribute+ ')';

bValue : SYM_TRUE | SYM_FALSE;
option 
    : KEYWORD_PRINT_SUCCESS bValue
    | KEYWORD_EXPAND_DEFINITIONS bValue
    | KEYWORD_INTERACTIVE_MODE bValue
    | KEYWORD_PRODUCE_PROOFS bValue
    | KEYWORD_PRODUCE_UNSAT_CORES bValue
    | KEYWORD_PRODUCE_MODELS bValue
    | KEYWORD_PRODUCE_ASSIGNMENTS bValue
    | KEYWORD_REGULAR_OUTPUT_CHANNEL STRING
    | KEYWORD_DIAGNOSTIC_OUTPUT_CHANNEL STRING
    | KEYWORD_RANDOM_SEED NUMERAL
    | KEYWORD_VERBOSITY NUMERAL
    | attribute
    ;

infoFlag 
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
    | '(' TOKEN_CMD_DEFINE_FUN symbol '(' sortedVar* ')' sort term ')'
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
    | '(' TOKEN_CMD_GET_INFO infoFlag ')'
    | '(' TOKEN_CMD_EXIT ')'
    ;

script : command+;

genResponse    : SYM_UNSUPPORTED | SYM_SUCCESS | '(' SYM_ERROR STRING ')';
errorBehavior  : SYM_IMMEDIATE_EXIT | SYM_CONTINUED_EXECUTION;
reasonUnknown  : SYM_MEMOUT | SYM_INCOMPLETE;
status         : SYM_SAT | SYM_UNSAT | SYM_UNKNOWN;
infoResponse   
    : KEYWORD_ERROR_BEHAVIOR errorBehavior
    | KEYWORD_NAME STRING
    | KEYWORD_AUTHORS STRING
    | KEYWORD_VERSION STRING
    | KEYWORD_REASON_UNKNOWN reasonUnknown
    | attribute
    ;

getInfoResponse       : '(' infoResponse+ ')';
checkSatResponse      : status;
getAssertionsResponse : '(' term+ ')';
proof                 : sExpr;
getProofResponse      : proof;
getUnsatCoreResponse  : '(' symbol+ ')';
valuationPair         : '(' term term ')';
getValueResponse      : '(' valuationPair+ ')';
tValuationPair        : '(' symbol bValue ')';
getAssignmentResponse : '(' tValuationPair* ')';
getOptionResponse     : attributeValue;