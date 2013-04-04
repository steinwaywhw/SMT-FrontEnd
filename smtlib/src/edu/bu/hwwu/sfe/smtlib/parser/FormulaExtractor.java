package edu.bu.hwwu.sfe.smtlib.parser;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeProperty;

/**
 * Created with IntelliJ IDEA.
 * User: hwwu
 * Date: 4/3/13
 * Time: 10:45 AM
 * To change this template use File | Settings | File Templates.
 */
public class FormulaExtractor extends SmtLibBaseListener {

    private ParserRuleContext term = null;

//    @Override
//    public void exitCommand(SmtLibParser.CommandContext ctx) {
//        if (ctx.TOKEN_CMD_ASSERT() != null) {
//            term = ctx.term(0);
//        }
//        super.exitCommand(ctx);
//    }

//    @Override
//    public void exitTermFunction(SmtLibParser.TermFunctionContext ctx) {
//        term = ctx.term(0);
//        super.exitTermFunction(ctx);
//    }
//
    @Override
    public void exitTermBinderLet(SmtLibParser.TermBinderLetContext ctx) {
        if (term == null) {
            term = ctx;
        }
        super.exitTermBinderLet(ctx);
    }

//    @Override
//    public void exitVar_binding(SmtLibParser.Var_bindingContext ctx) {
//        term = ctx;
//        super.exitVar_binding(ctx);
//    }


//    @Override
//    public void exitTermBinderExists(SmtLibParser.TermBinderExistsContext ctx) {
//        term = ctx;
//        super.exitTermBinderExists(ctx);    //To change body of overridden methods use File | Settings | File Templates.
//    }

    public ParserRuleContext subtree() {
        return term;
    }

}
