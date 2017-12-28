package com.personali.rolloutThrift.cli;

import com.beust.jcommander.Parameter;
import com.beust.jcommander.Parameters;
import com.personali.rolloutThrift.TRolloutThriftService;
import org.apache.thrift.TException;

import java.util.List;


@Parameters(commandNames = {"get"}, commandDescription = "Get features")
public class CommandGet {

    @Parameter(names = {"--all"}, description = "Get feature by name")
    public boolean all;

    @Parameter(names = {"--active"}, description = "Get feature by name")
    public boolean active;

    @Parameter(names = {"--feature"}, description = "Get feature by name")
    public List<String> feature;

    @Parameter(names = {"--user-id"}, description = "Get feature by name")
    public String userId;

    public void execute(TRolloutThriftService.Client client) throws TException {
        if(this.all)
            if(this.active)
                if(this.userId != null)
                    System.out.println(client.getAllActiveForUser(this.userId));
                else
                    System.out.println(client.getAllActive());

            else
                System.out.println(client.getAll());


        if(this.feature != null)
            System.out.println(client.multiGet(this.feature));

    }
}
