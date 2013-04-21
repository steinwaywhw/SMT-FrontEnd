// Generated from C:\Users\Steinway Wu\Documents\GitHub\SMTFrontEnd\smtlib\src\edu\bu\hwwu\sfe\smtlib\parser\SmtLib.g4 by ANTLR 4.0
package edu.bu.hwwu.sfe.smtlib.parser;
import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.runtime.Token;

public interface SmtLibVisitor<T> extends ParseTreeVisitor<T> {
	T visitBValue(SmtLibParser.BValueContext ctx);

	T visitSort(SmtLibParser.SortContext ctx);

	T visitGetValueResponse(SmtLibParser.GetValueResponseContext ctx);

	T visitGetUnsatCoreResponse(SmtLibParser.GetUnsatCoreResponseContext ctx);

	T visitSortedVar(SmtLibParser.SortedVarContext ctx);

	T visitFunSymbolDecl(SmtLibParser.FunSymbolDeclContext ctx);

	T visitProof(SmtLibParser.ProofContext ctx);

	T visitQualIdentifier(SmtLibParser.QualIdentifierContext ctx);

	T visitAttribute(SmtLibParser.AttributeContext ctx);

	T visitValuationPair(SmtLibParser.ValuationPairContext ctx);

	T visitGetAssertionsResponse(SmtLibParser.GetAssertionsResponseContext ctx);

	T visitTheoryDecl(SmtLibParser.TheoryDeclContext ctx);

	T visitTermConstant(SmtLibParser.TermConstantContext ctx);

	T visitCommand(SmtLibParser.CommandContext ctx);

	T visitVarBinding(SmtLibParser.VarBindingContext ctx);

	T visitCheckSatResponse(SmtLibParser.CheckSatResponseContext ctx);

	T visitReasonUnknown(SmtLibParser.ReasonUnknownContext ctx);

	T visitLogicAttribute(SmtLibParser.LogicAttributeContext ctx);

	T visitOption(SmtLibParser.OptionContext ctx);

	T visitGetProofResponse(SmtLibParser.GetProofResponseContext ctx);

	T visitInfoResponse(SmtLibParser.InfoResponseContext ctx);

	T visitMetaSpecConstant(SmtLibParser.MetaSpecConstantContext ctx);

	T visitErrorBehavior(SmtLibParser.ErrorBehaviorContext ctx);

	T visitInfoFlag(SmtLibParser.InfoFlagContext ctx);

	T visitSpecConstant(SmtLibParser.SpecConstantContext ctx);

	T visitTermAnnotation(SmtLibParser.TermAnnotationContext ctx);

	T visitParFunSymbolDecl(SmtLibParser.ParFunSymbolDeclContext ctx);

	T visitSExpr(SmtLibParser.SExprContext ctx);

	T visitSortSymbolDecl(SmtLibParser.SortSymbolDeclContext ctx);

	T visitSymbol(SmtLibParser.SymbolContext ctx);

	T visitTermBinderForAll(SmtLibParser.TermBinderForAllContext ctx);

	T visitStatus(SmtLibParser.StatusContext ctx);

	T visitKeyword(SmtLibParser.KeywordContext ctx);

	T visitGenResponse(SmtLibParser.GenResponseContext ctx);

	T visitTermVariable(SmtLibParser.TermVariableContext ctx);

	T visitTermFunction(SmtLibParser.TermFunctionContext ctx);

	T visitScript(SmtLibParser.ScriptContext ctx);

	T visitLogic(SmtLibParser.LogicContext ctx);

	T visitGetOptionResponse(SmtLibParser.GetOptionResponseContext ctx);

	T visitTValuationPair(SmtLibParser.TValuationPairContext ctx);

	T visitAttributeValue(SmtLibParser.AttributeValueContext ctx);

	T visitGetAssignmentResponse(SmtLibParser.GetAssignmentResponseContext ctx);

	T visitTermBinderExists(SmtLibParser.TermBinderExistsContext ctx);

	T visitTermBinderLet(SmtLibParser.TermBinderLetContext ctx);

	T visitGetInfoResponse(SmtLibParser.GetInfoResponseContext ctx);

	T visitTheoryAttribute(SmtLibParser.TheoryAttributeContext ctx);

	T visitIdentifier(SmtLibParser.IdentifierContext ctx);
}