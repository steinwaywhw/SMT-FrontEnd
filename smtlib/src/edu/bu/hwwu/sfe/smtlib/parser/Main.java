package edu.bu.hwwu.sfe.smtlib.parser;

import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.runtime.*;

import java.io.File;
import java.io.IOException;
import org.stringtemplate.v4.*;

public class Main {

    public static void main(String[] args) {
        try {
            testParser("/home/hwwu/SMT/smtlib-20130327/QF_UF/SEQ/SEQ004_size5.smt2");
            testPrettyPrinter("/home/hwwu/SMT/smtlib-20130327/QF_UF/SEQ/SEQ004_size5.smt2");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void testParser(String fileName) throws IOException {
        ANTLRInputStream input = new ANTLRFileStream(fileName);
        SmtLibLexer lexer = new SmtLibLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        SmtLibParser parser = new SmtLibParser(tokens);

        ParseTree tree = parser.script();

        ParseTreeWalker walker = new ParseTreeWalker();
        FormulaExtractor extractor = new FormulaExtractor();
        walker.walk(extractor, tree);

        System.out.println(extractor.subtree().toString());
        //extractor.subtree().inspect(parser);

    }

    public static void testPrettyPrinter(String fileName) throws IOException {
        ANTLRInputStream input = new ANTLRFileStream(fileName);
        SmtLibLexer lexer = new SmtLibLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        SmtLibParser parser = new SmtLibParser(tokens);

        ParseTree tree = parser.script();

        ParseTreeWalker walker = new ParseTreeWalker();
        FormulaExtractor extractor = new FormulaExtractor();
        walker.walk(extractor, tree);

        PrettyPrinter pp = new PrettyPrinter("/home/hwwu/SMT/SMT-FrontEnd.git/smtlib/src/edu/bu/hwwu/sfe/smtlib/parser/SmtLib.stg");
        ST st = pp.visit(extractor.subtree());

        //System.out.println(st.render(4));
        File file = new File("/home/hwwu/SMT/SMT-FrontEnd.git/smtlib/src/edu/bu/hwwu/sfe/smtlib/parser/output");

        st.write(file, null, "utf-8", 1);
        System.out.println("Finished\n");
    }
}
