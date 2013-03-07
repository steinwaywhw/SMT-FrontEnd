/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

grammar smtlib;
options {
    k=10;
}

fragment DIGIT      : [0-9];
fragment HEXDIGIT   : DIGIT | [a-fA-F];
fragment ALPHA      : [a-zA-Z];
fragment ESCAPE     : '\\' ('\\' | '"');
fragment SYM_CHAR   : [+-/*=%?!.$_~&^<>@];

NUMERAL     : '0' | [1-9]+ DIGIT*;
DECIMAL     : NUMERAL '.' [0]* NUMERAL;
HEXADECIMAL : '#x' HEXDIGIT+;
BINARY      : '#b' [01]+;
STRING      : '"' (ESCAPE | ~('\\' | '"')*) '"';
KEYWORD     : ':' (ALPHA | DIGIT | SYM_CHAR)+;
WS          : [\t\r\n\f ]+ {skip();};
fragment SIMPLE_SYM  : (ALPHA | SYM_CHAR) (DIGIT | ALPHA | SYM_CHAR)*;
fragment QUOTED_SYM  : '|' ~('|' | '\\')* '|';
SYMBOL      : SIMPLE_SYM | QUOTED_SYM;
COMMENT     : ';' ~('\n' | '\r')* {skip();};


spec_constant   : NUMERAL | DECIMAL | HEXADECIMAL | BINARY | STRING;
s_expr          : spec_constant | SYMBOL | KEYWORD | '(' s_expr* ')';
                                                  
identifier      : SYMBOL | '(' '_' SYMBOL NUMERAL+ ')';
sort            : identifier | '(' identifier sort+ ')';
attribute_value : SYMBOL | spec_constant | '(' s_expr* ')';
attribute       : KEYWORD | KEYWORD attribute_value;

qual_identifier : identifier | '(' 'as' identifier sort ')';
var_binding     : '(' SYMBOL term ')';
sorted_var      : '(' SYMBOL sort ')';
term           
    : spec_constant
    | qual_identifier
    | '(' qual_identifier term+ ')'
    | '(' 'let' '(' var_binding+ ')' term ')'
    | '(' 'forall' '(' sorted_var+ ')' term ')'
    | '(' 'exists' '(' sorted_var+ ')' term ')'
    | '(' '!' term attribute+ ')'
    ;
               
sort_symbol_decl    : '(' identifier NUMERAL attribute* ')';
meta_spec_constant  : 'NUMERAL' | 'DECIMAL' | 'STRING';
fun_symbol_decl     
    : '(' spec_constant sort attribute* ')'
    | '(' meta_spec_constant sort attribute* ')'
    | '(' identifier sort+ attribute* ')'
    ;
par_fun_symbol_decl 
    : fun_symbol_decl
    | '(' 'par' '(' SYMBOL+ ')' '(' identifier sort+ attribute* ')' ')'
    ;

theory_decl : '(' 'theory' SYMBOL? theory_attribute+ ')';

theory_attribute
    : ':sorts' '(' sort_symbol_decl+ ')'
    | ':funs' '(' par_fun_symbol_decl+ ')'
    | ':sorts-description' STRING
    | ':funs-description' STRING
    | ':definition' STRING
    | ':values' STRING
    | ':notes' STRING
    | attribute
    ;
            

logic_attribute 
    : ':theories' '(' SYMBOL+ ')'
    | ':language' STRING
    | ':extensions' STRING
    | ':values' STRING
    | ':notes' STRING
    | attribute
    ;
            
logic   : '(' 'logic' SYMBOL logic_attribute+ ')';

b_value : 'true' | 'false';
option 
    : ':print-success' b_value
    | ':expand-definitions' b_value
    | ':interactive-mode' b_value
    | ':produce-proofs' b_value
    | ':produce-unsat-cores' b_value
    | ':produce-models' b_value
    | ':produce-assignments' b_value
    | ':regular-output-channel' STRING
    | ':diagnostic-output-channel' STRING
    | ':random-seed' NUMERAL
    | ':verbosity' NUMERAL
    | attribute
    ;

INFO_FLAG_STATUS : ':status';
info_flag 
    : ':error-behavior'
    | ':name'
    | ':authors'
    | ':version'
    | INFO_FLAG_STATUS
    | ':reason-unknown'
    | KEYWORD
    | ':all-statistics'
    ;
      
command
    : '(' 'set-logic' SYMBOL ')'
    | '(' 'set-option' option ')'
    | '(' 'set-info' attribute ')'
    | '(' 'declare-sort' SYMBOL NUMERAL ')'
    | '(' 'define-sort' SYMBOL '(' SYMBOL* ')' sort ')'
    | '(' 'declare-fun' SYMBOL '(' sort* ')' sort ')'
    | '(' 'define-fun' SYMBOL '(' sorted_var* ')' sort term ')'
    | '(' 'push' NUMERAL ')'
    | '(' 'pop' NUMERAL ')'
    | '(' 'assert' term ')'
    | '(' 'check-sat' ')'
    | '(' 'get-assertions' ')'
    | '(' 'get-proof' ')'
    | '(' 'get-unset-core' ')'
    | '(' 'get-value' '(' term+ ')' ')'
    | '(' 'get-assignment' ')'
    | '(' 'get-option' KEYWORD ')'
    | '(' 'get-info' info_flag ')'
    | '(' 'exit' ')'
    ;

script : command+;

gen_response    : 'unsupported' | 'success' | '(' 'error' STRING ')';
error_behavior  : 'immediate-exit' | 'continued-execution';
reason_unknown  : 'memout' | 'incomplete';
status          : 'sat' | 'unsat' | 'unknown';
info_response   
    : ':error-behavior' error_behavior
    | ':name' STRING
    | ':authors' STRING
    | ':version' STRING
    | ':reason-unknown' reason_unknown
    | attribute
    ;
get_info_response       : '(' info_response+ ')';
check_sat_response      : status;
get_assertions_response : '(' term+ ')';
proof                   : s_expr;
get_proof_response      : proof;
get_unsat_core_response : '(' SYMBOL+ ')';
valuation_pair          : '(' term term ')';
get_value_response      : '(' valuation_pair+ ')';
t_valuation_pair        : '(' SYMBOL b_value ')';
get_assignment_response : '(' t_valuation_pair* ')';
get_option_response     : attribute_value;