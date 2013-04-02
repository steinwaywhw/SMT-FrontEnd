package edu.bu.hwwu.sfe.smtlib.parser;

import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.runtime.*;

import java.io.IOException;


public class Main {

    public static void main(String[] args) {
        try {
            testParser(args[0]);
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

        System.out.println(tree.toStringTree(parser));

    }
}
