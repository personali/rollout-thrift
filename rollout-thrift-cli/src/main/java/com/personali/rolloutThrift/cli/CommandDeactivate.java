package com.personali.rolloutThrift.cli;

import com.beust.jcommander.Parameter;
import com.beust.jcommander.Parameters;
import com.personali.rolloutThrift.TRolloutThriftService;
import org.apache.thrift.TException;


@Parameters(commandNames = {"deactivate"}, commandDescription = "activate feature")
public class CommandDeactivate{

    @Parameter(names = {"--feature"}, description = "Get feature by name", required = true)
    public String feature;

    @Parameter(names = {"--percentage"}, description = "Remove the percentage cap", required = false)
    public Integer percentage;

    @Parameter(names = {"--user-id"}, description = "deactivate only for user id", required = false)
    public String userId;

    public void execute(TRolloutThriftService.Client client) throws TException {
        if (this.percentage!= null) {
            client.deactivatePercentage(this.feature);
        } else {
            if(this.userId != null){
               client.deactivateUser(this.feature, this.userId);
            }
            else {
                client.deactivate(this.feature);
            }
        }

        System.out.println("Done...");
    }
}
