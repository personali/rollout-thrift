package com.personali.rolloutThrift;

import com.beust.jcommander.JCommander;
import com.beust.jcommander.ParameterException;
import com.beust.jcommander.Parameters;
import com.personali.rolloutThrift.cli.CommandActivate;
import com.personali.rolloutThrift.cli.CommandGet;
import com.personali.rolloutThrift.cli.CommandIsActive;
import com.personali.rolloutThrift.cli.CommandMain;
import org.apache.commons.cli.*;
import org.apache.thrift.TException;

import java.util.Arrays;
import java.util.List;

import static java.lang.System.exit;

/**
 * Hello world!
 */
public class CliApp {
    public static void main(String[] args) throws TException {

        Options options = new Options();

        CommandMain cm = new CommandMain();
        CommandGet cg = new CommandGet();
        CommandIsActive cia = new CommandIsActive();
        CommandActivate ca = new CommandActivate();
        JCommander jc = JCommander.newBuilder()
                .addObject(cm)
                .addCommand(cg)
                .addCommand(cia)
                .addCommand(ca)
                .build();

        try {
            jc.parse(args);
        }
        catch(Exception e){
            jc.usage();
            exit(1);
        }

        TRolloutThriftService.Client client = RolloutThriftClientFactory.create(cm.host);
        String s = jc.getParsedCommand();

        if (s.equals("get")) {
            cg.execute(client);
        } else if (s.equals("is-active")) {
            cia.execute(client);
        } else if (s.equals("activate")) {
            ca.execute(client);
        }

    }
}

