package edu.bu.hwwu.sfe.smtlib.parser;// Generated from /home/hwwu/SMT/SMT-FrontEnd.git/smtlib/src/SmtLib.g4 by ANTLR 4.0
import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.ParserRuleContext;

public class SmtLibBaseVisitor<T> extends AbstractParseTreeVisitor<T> implements SmtLibVisitor<T> {
	@Override public T visitQual_identifier(SmtLibParser.Qual_identifierContext ctx) { return visitChildren(ctx); }

	@Override public T visitTerm(SmtLibParser.TermContext ctx) { return visitChildren(ctx); }

	@Override public T visitAttribute(SmtLibParser.AttributeContext ctx) { return visitChildren(ctx); }

	@Override public T visitGet_unsat_core_response(SmtLibParser.Get_unsat_core_responseContext ctx) { return visitChildren(ctx); }

	@Override public T visitSymbol(SmtLibParser.SymbolContext ctx) { return visitChildren(ctx); }

	@Override public T visitOption(SmtLibParser.OptionContext ctx) { return visitChildren(ctx); }

	@Override public T visitT_valuation_pair(SmtLibParser.T_valuation_pairContext ctx) { return visitChildren(ctx); }

	@Override public T visitSpec_constant(SmtLibParser.Spec_constantContext ctx) { return visitChildren(ctx); }

	@Override public T visitScript(SmtLibParser.ScriptContext ctx) { return visitChildren(ctx); }

	@Override public T visitB_value(SmtLibParser.B_valueContext ctx) { return visitChildren(ctx); }

	@Override public T visitFun_symbol_decl(SmtLibParser.Fun_symbol_declContext ctx) { return visitChildren(ctx); }

	@Override public T visitCheck_sat_response(SmtLibParser.Check_sat_responseContext ctx) { return visitChildren(ctx); }

	@Override public T visitGet_assertions_response(SmtLibParser.Get_assertions_responseContext ctx) { return visitChildren(ctx); }

	@Override public T visitS_expr(SmtLibParser.S_exprContext ctx) { return visitChildren(ctx); }

	@Override public T visitIdentifier(SmtLibParser.IdentifierContext ctx) { return visitChildren(ctx); }

	@Override public T visitSorted_var(SmtLibParser.Sorted_varContext ctx) { return visitChildren(ctx); }

	@Override public T visitTheory_decl(SmtLibParser.Theory_declContext ctx) { return visitChildren(ctx); }

	@Override public T visitLogic_attribute(SmtLibParser.Logic_attributeContext ctx) { return visitChildren(ctx); }

	@Override public T visitAttribute_value(SmtLibParser.Attribute_valueContext ctx) { return visitChildren(ctx); }

	@Override public T visitReason_unknown(SmtLibParser.Reason_unknownContext ctx) { return visitChildren(ctx); }

	@Override public T visitGet_assignment_response(SmtLibParser.Get_assignment_responseContext ctx) { return visitChildren(ctx); }

	@Override public T visitValuation_pair(SmtLibParser.Valuation_pairContext ctx) { return visitChildren(ctx); }

	@Override public T visitGet_option_response(SmtLibParser.Get_option_responseContext ctx) { return visitChildren(ctx); }

	@Override public T visitInfo_response(SmtLibParser.Info_responseContext ctx) { return visitChildren(ctx); }

	@Override public T visitError_behavior(SmtLibParser.Error_behaviorContext ctx) { return visitChildren(ctx); }

	@Override public T visitMeta_spec_constant(SmtLibParser.Meta_spec_constantContext ctx) { return visitChildren(ctx); }

	@Override public T visitKeyword(SmtLibParser.KeywordContext ctx) { return visitChildren(ctx); }

	@Override public T visitGet_proof_response(SmtLibParser.Get_proof_responseContext ctx) { return visitChildren(ctx); }

	@Override public T visitInfo_flag(SmtLibParser.Info_flagContext ctx) { return visitChildren(ctx); }

	@Override public T visitStatus(SmtLibParser.StatusContext ctx) { return visitChildren(ctx); }

	@Override public T visitVar_binding(SmtLibParser.Var_bindingContext ctx) { return visitChildren(ctx); }

	@Override public T visitLogic(SmtLibParser.LogicContext ctx) { return visitChildren(ctx); }

	@Override public T visitGet_value_response(SmtLibParser.Get_value_responseContext ctx) { return visitChildren(ctx); }

	@Override public T visitGet_info_response(SmtLibParser.Get_info_responseContext ctx) { return visitChildren(ctx); }

	@Override public T visitSort_symbol_decl(SmtLibParser.Sort_symbol_declContext ctx) { return visitChildren(ctx); }

	@Override public T visitCommand(SmtLibParser.CommandContext ctx) { return visitChildren(ctx); }

	@Override public T visitGen_response(SmtLibParser.Gen_responseContext ctx) { return visitChildren(ctx); }

	@Override public T visitProof(SmtLibParser.ProofContext ctx) { return visitChildren(ctx); }

	@Override public T visitSort(SmtLibParser.SortContext ctx) { return visitChildren(ctx); }

	@Override public T visitPar_fun_symbol_decl(SmtLibParser.Par_fun_symbol_declContext ctx) { return visitChildren(ctx); }

	@Override public T visitTheory_attribute(SmtLibParser.Theory_attributeContext ctx) { return visitChildren(ctx); }
}