package edu.bu.hwwu.sfe.smtlib.parser;

import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: Steinway Wu
 * Date: 13-4-10
 * Time: 上午12:35
 * To change this template use File | Settings | File Templates.
 */
public class StaticAnalyst extends SmtLibBaseListener {

    @Override
    public void enterCommand(SmtLibParser.CommandContext ctx) {
        super.enterCommand(ctx);
        if (ctx.TOKEN_CMD_DECLARE_FUN().getSymbol() != null) {

        }

    }
}
