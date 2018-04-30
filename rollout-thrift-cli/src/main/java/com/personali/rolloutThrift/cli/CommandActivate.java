package com.personali.rolloutThrift.cli;

import com.beust.jcommander.Parameter;
import com.beust.jcommander.Parameters;
import com.personali.rolloutThrift.RolloutThriftCacheClient;
import org.apache.thrift.TException;


@Parameters(commandNames = {"activate"}, commandDescription = "activate feature")
public class CommandActivate {

    @Parameter(names = {"--feature"}, description = "Get feature by name", required = true)
    public String feature;

    @Parameter(names = {"--percentage"}, description = "Activate only for X% of users", required = false)
    public Integer percentage;

    @Parameter(names = {"--user-id"}, description = "Activate only for user id", required = false)
    public String userId;

    public void execute(RolloutThriftCacheClient client) throws TException {
        if (this.percentage!= null) {
            client.activatePercentage(this.feature, this.percentage);
        } else {
            if(this.userId != null){
               client.activateUser(this.feature, this.userId);
            }
            else {
                client.activate(this.feature);
            }
        }

        System.out.println("Done...");
    }
}
