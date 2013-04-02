package edu.bu.hwwu.sfe.smtlib.parser;// Generated from /home/hwwu/SMT/SMT-FrontEnd.git/smtlib/src/SmtLib.g4 by ANTLR 4.0
import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.runtime.Token;

public interface SmtLibListener extends ParseTreeListener {
	void enterQual_identifier(SmtLibParser.Qual_identifierContext ctx);
	void exitQual_identifier(SmtLibParser.Qual_identifierContext ctx);

	void enterTerm(SmtLibParser.TermContext ctx);
	void exitTerm(SmtLibParser.TermContext ctx);

	void enterAttribute(SmtLibParser.AttributeContext ctx);
	void exitAttribute(SmtLibParser.AttributeContext ctx);

	void enterGet_unsat_core_response(SmtLibParser.Get_unsat_core_responseContext ctx);
	void exitGet_unsat_core_response(SmtLibParser.Get_unsat_core_responseContext ctx);

	void enterSymbol(SmtLibParser.SymbolContext ctx);
	void exitSymbol(SmtLibParser.SymbolContext ctx);

	void enterOption(SmtLibParser.OptionContext ctx);
	void exitOption(SmtLibParser.OptionContext ctx);

	void enterT_valuation_pair(SmtLibParser.T_valuation_pairContext ctx);
	void exitT_valuation_pair(SmtLibParser.T_valuation_pairContext ctx);

	void enterSpec_constant(SmtLibParser.Spec_constantContext ctx);
	void exitSpec_constant(SmtLibParser.Spec_constantContext ctx);

	void enterScript(SmtLibParser.ScriptContext ctx);
	void exitScript(SmtLibParser.ScriptContext ctx);

	void enterB_value(SmtLibParser.B_valueContext ctx);
	void exitB_value(SmtLibParser.B_valueContext ctx);

	void enterFun_symbol_decl(SmtLibParser.Fun_symbol_declContext ctx);
	void exitFun_symbol_decl(SmtLibParser.Fun_symbol_declContext ctx);

	void enterCheck_sat_response(SmtLibParser.Check_sat_responseContext ctx);
	void exitCheck_sat_response(SmtLibParser.Check_sat_responseContext ctx);

	void enterGet_assertions_response(SmtLibParser.Get_assertions_responseContext ctx);
	void exitGet_assertions_response(SmtLibParser.Get_assertions_responseContext ctx);

	void enterS_expr(SmtLibParser.S_exprContext ctx);
	void exitS_expr(SmtLibParser.S_exprContext ctx);

	void enterIdentifier(SmtLibParser.IdentifierContext ctx);
	void exitIdentifier(SmtLibParser.IdentifierContext ctx);

	void enterSorted_var(SmtLibParser.Sorted_varContext ctx);
	void exitSorted_var(SmtLibParser.Sorted_varContext ctx);

	void enterTheory_decl(SmtLibParser.Theory_declContext ctx);
	void exitTheory_decl(SmtLibParser.Theory_declContext ctx);

	void enterLogic_attribute(SmtLibParser.Logic_attributeContext ctx);
	void exitLogic_attribute(SmtLibParser.Logic_attributeContext ctx);

	void enterAttribute_value(SmtLibParser.Attribute_valueContext ctx);
	void exitAttribute_value(SmtLibParser.Attribute_valueContext ctx);

	void enterReason_unknown(SmtLibParser.Reason_unknownContext ctx);
	void exitReason_unknown(SmtLibParser.Reason_unknownContext ctx);

	void enterGet_assignment_response(SmtLibParser.Get_assignment_responseContext ctx);
	void exitGet_assignment_response(SmtLibParser.Get_assignment_responseContext ctx);

	void enterValuation_pair(SmtLibParser.Valuation_pairContext ctx);
	void exitValuation_pair(SmtLibParser.Valuation_pairContext ctx);

	void enterGet_option_response(SmtLibParser.Get_option_responseContext ctx);
	void exitGet_option_response(SmtLibParser.Get_option_responseContext ctx);

	void enterInfo_response(SmtLibParser.Info_responseContext ctx);
	void exitInfo_response(SmtLibParser.Info_responseContext ctx);

	void enterError_behavior(SmtLibParser.Error_behaviorContext ctx);
	void exitError_behavior(SmtLibParser.Error_behaviorContext ctx);

	void enterMeta_spec_constant(SmtLibParser.Meta_spec_constantContext ctx);
	void exitMeta_spec_constant(SmtLibParser.Meta_spec_constantContext ctx);

	void enterKeyword(SmtLibParser.KeywordContext ctx);
	void exitKeyword(SmtLibParser.KeywordContext ctx);

	void enterGet_proof_response(SmtLibParser.Get_proof_responseContext ctx);
	void exitGet_proof_response(SmtLibParser.Get_proof_responseContext ctx);

	void enterInfo_flag(SmtLibParser.Info_flagContext ctx);
	void exitInfo_flag(SmtLibParser.Info_flagContext ctx);

	void enterStatus(SmtLibParser.StatusContext ctx);
	void exitStatus(SmtLibParser.StatusContext ctx);

	void enterVar_binding(SmtLibParser.Var_bindingContext ctx);
	void exitVar_binding(SmtLibParser.Var_bindingContext ctx);

	void enterLogic(SmtLibParser.LogicContext ctx);
	void exitLogic(SmtLibParser.LogicContext ctx);

	void enterGet_value_response(SmtLibParser.Get_value_responseContext ctx);
	void exitGet_value_response(SmtLibParser.Get_value_responseContext ctx);

	void enterGet_info_response(SmtLibParser.Get_info_responseContext ctx);
	void exitGet_info_response(SmtLibParser.Get_info_responseContext ctx);

	void enterSort_symbol_decl(SmtLibParser.Sort_symbol_declContext ctx);
	void exitSort_symbol_decl(SmtLibParser.Sort_symbol_declContext ctx);

	void enterCommand(SmtLibParser.CommandContext ctx);
	void exitCommand(SmtLibParser.CommandContext ctx);

	void enterGen_response(SmtLibParser.Gen_responseContext ctx);
	void exitGen_response(SmtLibParser.Gen_responseContext ctx);

	void enterProof(SmtLibParser.ProofContext ctx);
	void exitProof(SmtLibParser.ProofContext ctx);

	void enterSort(SmtLibParser.SortContext ctx);
	void exitSort(SmtLibParser.SortContext ctx);

	void enterPar_fun_symbol_decl(SmtLibParser.Par_fun_symbol_declContext ctx);
	void exitPar_fun_symbol_decl(SmtLibParser.Par_fun_symbol_declContext ctx);

	void enterTheory_attribute(SmtLibParser.Theory_attributeContext ctx);
	void exitTheory_attribute(SmtLibParser.Theory_attributeContext ctx);
}