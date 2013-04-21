package edu.bu.hwwu.sfe.smtlib.parser;

import org.stringtemplate.v4.*;

/**
 * Created with IntelliJ IDEA.
 * User: hwwu
 * Date: 4/3/13
 * Time: 2:02 PM
 * To change this template use File | Settings | File Templates.
 */
public class PrettyPrinter extends SmtLibBaseVisitor<ST> {

    STGroup stg = null;

    public PrettyPrinter (String stFile) {
        stg = new STGroupFile(stFile);
    }

    @Override
    public ST visitTermAnnotation(SmtLibParser.TermAnnotationContext ctx) {
        ST st = stg.getInstanceOf("termAnnotation");
        st.add("term", visit(ctx.term()));
        st.add("attr", ctx.attribute());
        super.visitTermAnnotation(ctx);
        return st;
    }

    @Override
    public ST visitTermBinderExists(SmtLibParser.TermBinderExistsContext ctx) {
        ST st = stg.getInstanceOf("termBinderExists");
        st.add("bindings", ctx.sortedVar());
        st.add("term", visit(ctx.term()));
        super.visitTermBinderExists(ctx);
        return st;
    }

    @Override
    public ST visitTermBinderForAll(SmtLibParser.TermBinderForAllContext ctx) {
        ST st = stg.getInstanceOf("termBinderForAll");
        st.add("bindings", ctx.sortedVar());
        st.add("term", visit(ctx.term()));
        super.visitTermBinderForAll(ctx);
        return st;
    }

    @Override
    public ST visitTermBinderLet(SmtLibParser.TermBinderLetContext ctx) {
        ST st = stg.getInstanceOf("termBinderLet");
        for (SmtLibParser.VarBindingContext v : ctx.varBinding()) {
            st.add("bindings", visit(v));
        }
        st.add("term", visit(ctx.term()));
        super.visitTermBinderLet(ctx);
        //System.out.println("LET");
        return st;
    }

    @Override
    public ST visitTermConstant(SmtLibParser.TermConstantContext ctx) {
        ST st = stg.getInstanceOf("termConstant");
        st.add("t", ctx.getText());
        super.visitTermConstant(ctx);
        //System.out.println("CONSTANT: " + ctx.getText());
        return st;
    }

    @Override
    public ST visitTermFunction(SmtLibParser.TermFunctionContext ctx) {
        ST st = stg.getInstanceOf("termFunction");
        st.add("id", ctx.qualIdentifier().getText());
        for (SmtLibParser.TermContext t : ctx.term())
            st.add("terms", visit(t));
        super.visitTermFunction(ctx);
        //System.out.println("FUNCTION: " + ctx.qual_identifier().getText());
        return st;
    }

    @Override
    public ST visitTermVariable(SmtLibParser.TermVariableContext ctx) {
        ST st = stg.getInstanceOf("termId");
        st.add("t", ctx.getText());
        super.visitTermVariable(ctx);
        //System.out.println("VARIABLE: " + ctx.getText());
        return st;
    }

    @Override
    public ST visitVarBinding(SmtLibParser.VarBindingContext ctx) {
        ST st = stg.getInstanceOf("varBinding");
        st.add("symbol", ctx.symbol().getText());
        st.add("term", visit(ctx.term()));
        super.visitVarBinding(ctx);
        return st;
    }

    @Override
    public ST visitSortedVar(SmtLibParser.SortedVarContext ctx) {
        ST st = stg.getInstanceOf("sortedVar");
        st.add("symbol", ctx.symbol().getText());
        st.add("sort", ctx.sort().getText());
        super.visitSortedVar(ctx);
        return st;
    }
}
