// Generated from /home/hwwu/SMT/SMT-FrontEnd.git/smtlib/src/edu/bu/hwwu/sfe/smtlib/parser/SmtLib.g4 by ANTLR 4.0
package edu.bu.hwwu.sfe.smtlib.parser;
import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.runtime.Token;

public interface SmtLibVisitor<T> extends ParseTreeVisitor<T> {
	T visitPar_fun_symbol_decl(SmtLibParser.Par_fun_symbol_declContext ctx);

	T visitLogic_attribute(SmtLibParser.Logic_attributeContext ctx);

	T visitInfo_response(SmtLibParser.Info_responseContext ctx);

	T visitLogic(SmtLibParser.LogicContext ctx);

	T visitAttribute_value(SmtLibParser.Attribute_valueContext ctx);

	T visitTermBinderForAll(SmtLibParser.TermBinderForAllContext ctx);

	T visitIdentifier(SmtLibParser.IdentifierContext ctx);

	T visitGen_response(SmtLibParser.Gen_responseContext ctx);

	T visitProof(SmtLibParser.ProofContext ctx);

	T visitCheck_sat_response(SmtLibParser.Check_sat_responseContext ctx);

	T visitStatus(SmtLibParser.StatusContext ctx);

	T visitSort_symbol_decl(SmtLibParser.Sort_symbol_declContext ctx);

	T visitFun_symbol_decl(SmtLibParser.Fun_symbol_declContext ctx);

	T visitScript(SmtLibParser.ScriptContext ctx);

	T visitTheory_attribute(SmtLibParser.Theory_attributeContext ctx);

	T visitKeyword(SmtLibParser.KeywordContext ctx);

	T visitMeta_spec_constant(SmtLibParser.Meta_spec_constantContext ctx);

	T visitError_behavior(SmtLibParser.Error_behaviorContext ctx);

	T visitTermBinderExists(SmtLibParser.TermBinderExistsContext ctx);

	T visitSort(SmtLibParser.SortContext ctx);

	T visitGet_info_response(SmtLibParser.Get_info_responseContext ctx);

	T visitReason_unknown(SmtLibParser.Reason_unknownContext ctx);

	T visitS_expr(SmtLibParser.S_exprContext ctx);

	T visitB_value(SmtLibParser.B_valueContext ctx);

	T visitAttribute(SmtLibParser.AttributeContext ctx);

	T visitGet_assertions_response(SmtLibParser.Get_assertions_responseContext ctx);

	T visitInfo_flag(SmtLibParser.Info_flagContext ctx);

	T visitGet_value_response(SmtLibParser.Get_value_responseContext ctx);

	T visitOption(SmtLibParser.OptionContext ctx);

	T visitTermAnnotation(SmtLibParser.TermAnnotationContext ctx);

	T visitValuation_pair(SmtLibParser.Valuation_pairContext ctx);

	T visitGet_assignment_response(SmtLibParser.Get_assignment_responseContext ctx);

	T visitGet_option_response(SmtLibParser.Get_option_responseContext ctx);

	T visitCommand(SmtLibParser.CommandContext ctx);

	T visitTermVariable(SmtLibParser.TermVariableContext ctx);

	T visitT_valuation_pair(SmtLibParser.T_valuation_pairContext ctx);

	T visitTermFunction(SmtLibParser.TermFunctionContext ctx);

	T visitQual_identifier(SmtLibParser.Qual_identifierContext ctx);

	T visitSorted_var(SmtLibParser.Sorted_varContext ctx);

	T visitSymbol(SmtLibParser.SymbolContext ctx);

	T visitGet_proof_response(SmtLibParser.Get_proof_responseContext ctx);

	T visitVar_binding(SmtLibParser.Var_bindingContext ctx);

	T visitTermBinderLet(SmtLibParser.TermBinderLetContext ctx);

	T visitGet_unsat_core_response(SmtLibParser.Get_unsat_core_responseContext ctx);

	T visitTermConstant(SmtLibParser.TermConstantContext ctx);

	T visitSpec_constant(SmtLibParser.Spec_constantContext ctx);

	T visitTheory_decl(SmtLibParser.Theory_declContext ctx);
}