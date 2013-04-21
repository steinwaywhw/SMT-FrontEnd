// Generated from C:\Users\Steinway Wu\Documents\GitHub\SMTFrontEnd\smtlib\src\edu\bu\hwwu\sfe\smtlib\parser\SmtLib.g4 by ANTLR 4.0
package edu.bu.hwwu.sfe.smtlib.parser;
import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.ParserRuleContext;

public class SmtLibBaseVisitor<T> extends AbstractParseTreeVisitor<T> implements SmtLibVisitor<T> {
	@Override public T visitBValue(SmtLibParser.BValueContext ctx) { return visitChildren(ctx); }

	@Override public T visitSort(SmtLibParser.SortContext ctx) { return visitChildren(ctx); }

	@Override public T visitGetValueResponse(SmtLibParser.GetValueResponseContext ctx) { return visitChildren(ctx); }

	@Override public T visitGetUnsatCoreResponse(SmtLibParser.GetUnsatCoreResponseContext ctx) { return visitChildren(ctx); }

	@Override public T visitSortedVar(SmtLibParser.SortedVarContext ctx) { return visitChildren(ctx); }

	@Override public T visitFunSymbolDecl(SmtLibParser.FunSymbolDeclContext ctx) { return visitChildren(ctx); }

	@Override public T visitProof(SmtLibParser.ProofContext ctx) { return visitChildren(ctx); }

	@Override public T visitQualIdentifier(SmtLibParser.QualIdentifierContext ctx) { return visitChildren(ctx); }

	@Override public T visitAttribute(SmtLibParser.AttributeContext ctx) { return visitChildren(ctx); }

	@Override public T visitValuationPair(SmtLibParser.ValuationPairContext ctx) { return visitChildren(ctx); }

	@Override public T visitGetAssertionsResponse(SmtLibParser.GetAssertionsResponseContext ctx) { return visitChildren(ctx); }

	@Override public T visitTheoryDecl(SmtLibParser.TheoryDeclContext ctx) { return visitChildren(ctx); }

	@Override public T visitTermConstant(SmtLibParser.TermConstantContext ctx) { return visitChildren(ctx); }

	@Override public T visitCommand(SmtLibParser.CommandContext ctx) { return visitChildren(ctx); }

	@Override public T visitVarBinding(SmtLibParser.VarBindingContext ctx) { return visitChildren(ctx); }

	@Override public T visitCheckSatResponse(SmtLibParser.CheckSatResponseContext ctx) { return visitChildren(ctx); }

	@Override public T visitReasonUnknown(SmtLibParser.ReasonUnknownContext ctx) { return visitChildren(ctx); }

	@Override public T visitLogicAttribute(SmtLibParser.LogicAttributeContext ctx) { return visitChildren(ctx); }

	@Override public T visitOption(SmtLibParser.OptionContext ctx) { return visitChildren(ctx); }

	@Override public T visitGetProofResponse(SmtLibParser.GetProofResponseContext ctx) { return visitChildren(ctx); }

	@Override public T visitInfoResponse(SmtLibParser.InfoResponseContext ctx) { return visitChildren(ctx); }

	@Override public T visitMetaSpecConstant(SmtLibParser.MetaSpecConstantContext ctx) { return visitChildren(ctx); }

	@Override public T visitErrorBehavior(SmtLibParser.ErrorBehaviorContext ctx) { return visitChildren(ctx); }

	@Override public T visitInfoFlag(SmtLibParser.InfoFlagContext ctx) { return visitChildren(ctx); }

	@Override public T visitSpecConstant(SmtLibParser.SpecConstantContext ctx) { return visitChildren(ctx); }

	@Override public T visitTermAnnotation(SmtLibParser.TermAnnotationContext ctx) { return visitChildren(ctx); }

	@Override public T visitParFunSymbolDecl(SmtLibParser.ParFunSymbolDeclContext ctx) { return visitChildren(ctx); }

	@Override public T visitSExpr(SmtLibParser.SExprContext ctx) { return visitChildren(ctx); }

	@Override public T visitSortSymbolDecl(SmtLibParser.SortSymbolDeclContext ctx) { return visitChildren(ctx); }

	@Override public T visitSymbol(SmtLibParser.SymbolContext ctx) { return visitChildren(ctx); }

	@Override public T visitTermBinderForAll(SmtLibParser.TermBinderForAllContext ctx) { return visitChildren(ctx); }

	@Override public T visitStatus(SmtLibParser.StatusContext ctx) { return visitChildren(ctx); }

	@Override public T visitKeyword(SmtLibParser.KeywordContext ctx) { return visitChildren(ctx); }

	@Override public T visitGenResponse(SmtLibParser.GenResponseContext ctx) { return visitChildren(ctx); }

	@Override public T visitTermVariable(SmtLibParser.TermVariableContext ctx) { return visitChildren(ctx); }

	@Override public T visitTermFunction(SmtLibParser.TermFunctionContext ctx) { return visitChildren(ctx); }

	@Override public T visitScript(SmtLibParser.ScriptContext ctx) { return visitChildren(ctx); }

	@Override public T visitLogic(SmtLibParser.LogicContext ctx) { return visitChildren(ctx); }

	@Override public T visitGetOptionResponse(SmtLibParser.GetOptionResponseContext ctx) { return visitChildren(ctx); }

	@Override public T visitTValuationPair(SmtLibParser.TValuationPairContext ctx) { return visitChildren(ctx); }

	@Override public T visitAttributeValue(SmtLibParser.AttributeValueContext ctx) { return visitChildren(ctx); }

	@Override public T visitGetAssignmentResponse(SmtLibParser.GetAssignmentResponseContext ctx) { return visitChildren(ctx); }

	@Override public T visitTermBinderExists(SmtLibParser.TermBinderExistsContext ctx) { return visitChildren(ctx); }

	@Override public T visitTermBinderLet(SmtLibParser.TermBinderLetContext ctx) { return visitChildren(ctx); }

	@Override public T visitGetInfoResponse(SmtLibParser.GetInfoResponseContext ctx) { return visitChildren(ctx); }

	@Override public T visitTheoryAttribute(SmtLibParser.TheoryAttributeContext ctx) { return visitChildren(ctx); }

	@Override public T visitIdentifier(SmtLibParser.IdentifierContext ctx) { return visitChildren(ctx); }
}