// Generated from C:\Users\Steinway Wu\Documents\GitHub\SMTFrontEnd\smtlib\src\edu\bu\hwwu\sfe\smtlib\parser\SmtLib.g4 by ANTLR 4.0
package edu.bu.hwwu.sfe.smtlib.parser;
import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.runtime.Token;

public interface SmtLibListener extends ParseTreeListener {
	void enterBValue(SmtLibParser.BValueContext ctx);
	void exitBValue(SmtLibParser.BValueContext ctx);

	void enterSort(SmtLibParser.SortContext ctx);
	void exitSort(SmtLibParser.SortContext ctx);

	void enterGetValueResponse(SmtLibParser.GetValueResponseContext ctx);
	void exitGetValueResponse(SmtLibParser.GetValueResponseContext ctx);

	void enterGetUnsatCoreResponse(SmtLibParser.GetUnsatCoreResponseContext ctx);
	void exitGetUnsatCoreResponse(SmtLibParser.GetUnsatCoreResponseContext ctx);

	void enterSortedVar(SmtLibParser.SortedVarContext ctx);
	void exitSortedVar(SmtLibParser.SortedVarContext ctx);

	void enterFunSymbolDecl(SmtLibParser.FunSymbolDeclContext ctx);
	void exitFunSymbolDecl(SmtLibParser.FunSymbolDeclContext ctx);

	void enterProof(SmtLibParser.ProofContext ctx);
	void exitProof(SmtLibParser.ProofContext ctx);

	void enterQualIdentifier(SmtLibParser.QualIdentifierContext ctx);
	void exitQualIdentifier(SmtLibParser.QualIdentifierContext ctx);

	void enterAttribute(SmtLibParser.AttributeContext ctx);
	void exitAttribute(SmtLibParser.AttributeContext ctx);

	void enterValuationPair(SmtLibParser.ValuationPairContext ctx);
	void exitValuationPair(SmtLibParser.ValuationPairContext ctx);

	void enterGetAssertionsResponse(SmtLibParser.GetAssertionsResponseContext ctx);
	void exitGetAssertionsResponse(SmtLibParser.GetAssertionsResponseContext ctx);

	void enterTheoryDecl(SmtLibParser.TheoryDeclContext ctx);
	void exitTheoryDecl(SmtLibParser.TheoryDeclContext ctx);

	void enterTermConstant(SmtLibParser.TermConstantContext ctx);
	void exitTermConstant(SmtLibParser.TermConstantContext ctx);

	void enterCommand(SmtLibParser.CommandContext ctx);
	void exitCommand(SmtLibParser.CommandContext ctx);

	void enterVarBinding(SmtLibParser.VarBindingContext ctx);
	void exitVarBinding(SmtLibParser.VarBindingContext ctx);

	void enterCheckSatResponse(SmtLibParser.CheckSatResponseContext ctx);
	void exitCheckSatResponse(SmtLibParser.CheckSatResponseContext ctx);

	void enterReasonUnknown(SmtLibParser.ReasonUnknownContext ctx);
	void exitReasonUnknown(SmtLibParser.ReasonUnknownContext ctx);

	void enterLogicAttribute(SmtLibParser.LogicAttributeContext ctx);
	void exitLogicAttribute(SmtLibParser.LogicAttributeContext ctx);

	void enterOption(SmtLibParser.OptionContext ctx);
	void exitOption(SmtLibParser.OptionContext ctx);

	void enterGetProofResponse(SmtLibParser.GetProofResponseContext ctx);
	void exitGetProofResponse(SmtLibParser.GetProofResponseContext ctx);

	void enterInfoResponse(SmtLibParser.InfoResponseContext ctx);
	void exitInfoResponse(SmtLibParser.InfoResponseContext ctx);

	void enterMetaSpecConstant(SmtLibParser.MetaSpecConstantContext ctx);
	void exitMetaSpecConstant(SmtLibParser.MetaSpecConstantContext ctx);

	void enterErrorBehavior(SmtLibParser.ErrorBehaviorContext ctx);
	void exitErrorBehavior(SmtLibParser.ErrorBehaviorContext ctx);

	void enterInfoFlag(SmtLibParser.InfoFlagContext ctx);
	void exitInfoFlag(SmtLibParser.InfoFlagContext ctx);

	void enterSpecConstant(SmtLibParser.SpecConstantContext ctx);
	void exitSpecConstant(SmtLibParser.SpecConstantContext ctx);

	void enterTermAnnotation(SmtLibParser.TermAnnotationContext ctx);
	void exitTermAnnotation(SmtLibParser.TermAnnotationContext ctx);

	void enterParFunSymbolDecl(SmtLibParser.ParFunSymbolDeclContext ctx);
	void exitParFunSymbolDecl(SmtLibParser.ParFunSymbolDeclContext ctx);

	void enterSExpr(SmtLibParser.SExprContext ctx);
	void exitSExpr(SmtLibParser.SExprContext ctx);

	void enterSortSymbolDecl(SmtLibParser.SortSymbolDeclContext ctx);
	void exitSortSymbolDecl(SmtLibParser.SortSymbolDeclContext ctx);

	void enterSymbol(SmtLibParser.SymbolContext ctx);
	void exitSymbol(SmtLibParser.SymbolContext ctx);

	void enterTermBinderForAll(SmtLibParser.TermBinderForAllContext ctx);
	void exitTermBinderForAll(SmtLibParser.TermBinderForAllContext ctx);

	void enterStatus(SmtLibParser.StatusContext ctx);
	void exitStatus(SmtLibParser.StatusContext ctx);

	void enterKeyword(SmtLibParser.KeywordContext ctx);
	void exitKeyword(SmtLibParser.KeywordContext ctx);

	void enterGenResponse(SmtLibParser.GenResponseContext ctx);
	void exitGenResponse(SmtLibParser.GenResponseContext ctx);

	void enterTermVariable(SmtLibParser.TermVariableContext ctx);
	void exitTermVariable(SmtLibParser.TermVariableContext ctx);

	void enterTermFunction(SmtLibParser.TermFunctionContext ctx);
	void exitTermFunction(SmtLibParser.TermFunctionContext ctx);

	void enterScript(SmtLibParser.ScriptContext ctx);
	void exitScript(SmtLibParser.ScriptContext ctx);

	void enterLogic(SmtLibParser.LogicContext ctx);
	void exitLogic(SmtLibParser.LogicContext ctx);

	void enterGetOptionResponse(SmtLibParser.GetOptionResponseContext ctx);
	void exitGetOptionResponse(SmtLibParser.GetOptionResponseContext ctx);

	void enterTValuationPair(SmtLibParser.TValuationPairContext ctx);
	void exitTValuationPair(SmtLibParser.TValuationPairContext ctx);

	void enterAttributeValue(SmtLibParser.AttributeValueContext ctx);
	void exitAttributeValue(SmtLibParser.AttributeValueContext ctx);

	void enterGetAssignmentResponse(SmtLibParser.GetAssignmentResponseContext ctx);
	void exitGetAssignmentResponse(SmtLibParser.GetAssignmentResponseContext ctx);

	void enterTermBinderExists(SmtLibParser.TermBinderExistsContext ctx);
	void exitTermBinderExists(SmtLibParser.TermBinderExistsContext ctx);

	void enterTermBinderLet(SmtLibParser.TermBinderLetContext ctx);
	void exitTermBinderLet(SmtLibParser.TermBinderLetContext ctx);

	void enterGetInfoResponse(SmtLibParser.GetInfoResponseContext ctx);
	void exitGetInfoResponse(SmtLibParser.GetInfoResponseContext ctx);

	void enterTheoryAttribute(SmtLibParser.TheoryAttributeContext ctx);
	void exitTheoryAttribute(SmtLibParser.TheoryAttributeContext ctx);

	void enterIdentifier(SmtLibParser.IdentifierContext ctx);
	void exitIdentifier(SmtLibParser.IdentifierContext ctx);
}