package com.personali.rolloutThrift.cli;

import com.beust.jcommander.Parameter;
import com.beust.jcommander.Parameters;
import com.personali.rolloutThrift.TRolloutThriftService;
import org.apache.thrift.TException;

import java.util.List;


@Parameters(commandNames = {"get"}, commandDescription = "Get feature")
public class CommandGet {

    @Parameter(names = {"--feature"}, description = "Get feature by name", required = true)
    public List<String> feature;

    public void execute(TRolloutThriftService.Client client) throws TException {
        System.out.println(client.multiGet(this.feature));
    }
}
