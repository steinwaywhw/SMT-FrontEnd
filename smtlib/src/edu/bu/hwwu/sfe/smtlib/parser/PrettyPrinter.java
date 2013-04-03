package edu.bu.hwwu.sfe.smtlib.parser;

import org.antlr.v4.runtime.ParserRuleContext;
import org.antlr.v4.runtime.tree.ErrorNode;
import org.antlr.v4.runtime.tree.ParseTreeProperty;
import org.antlr.v4.runtime.tree.TerminalNode;

/**
 * Created with IntelliJ IDEA.
 * User: hwwu
 * Date: 4/1/13
 * Time: 11:03 PM
 * To change this template use File | Settings | File Templates.
 */
public class PrettyPrinter extends SmtLibBaseListener {

    private StringBuilder builder = new StringBuilder();
    private ParseTreeProperty<String> property = new ParseTreeProperty<String>();

    @Override
    public void exitTermAnnotation(SmtLibParser.TermAnnotationContext ctx) {
        super.exitTermAnnotation(ctx);    //To change body of overridden methods use File | Settings | File Templates.
    }

    @Override
    public void exitTermBinderExists(SmtLibParser.TermBinderExistsContext ctx) {
        super.exitTermBinderExists(ctx);    //To change body of overridden methods use File | Settings | File Templates.
    }

    @Override
    public void exitTermBinderForAll(SmtLibParser.TermBinderForAllContext ctx) {
        super.exitTermBinderForAll(ctx);    //To change body of overridden methods use File | Settings | File Templates.
    }

    @Override
    public void exitTermBinderLet(SmtLibParser.TermBinderLetContext ctx) {
        super.exitTermBinderLet(ctx);    //To change body of overridden methods use File | Settings | File Templates.
    }

    @Override
    public void exitTermConstant(SmtLibParser.TermConstantContext ctx) {
        property.put(ctx, ctx.getText());
        super.exitTermConstant(ctx);
    }

    @Override
    public void exitTermFunction(SmtLibParser.TermFunctionContext ctx) {
        StringBuilder builder = new StringBuilder();
        builder
            .append("( ")
            .append(ctx.qual_identifier().getText())
            .append(property.get(ctx.))
        super.exitTermFunction(ctx);
    }

    @Override
    public void exitTermVariable(SmtLibParser.TermVariableContext ctx) {
        super.exitTermVariable(ctx);    //To change body of overridden methods use File | Settings | File Templates.
    }
}
