package com.personali.rolloutThrift.cli;

import com.beust.jcommander.Parameter;
import com.beust.jcommander.Parameters;
import com.personali.rolloutThrift.TRolloutThriftService;
import org.apache.thrift.TException;


@Parameters(commandNames = {"activate"}, commandDescription = "activate feature")
public class CommandActivate {

    @Parameter(names = {"--feature"}, description = "Get feature by name", required = true)
    public String feature;

    @Parameter(names = {"--percentage"}, description = "Activate only for X% of users", required = false)
    public Integer percentage;


    public void execute(TRolloutThriftService.Client client) throws TException {
        if (this.percentage!= null) {
            client.activatePercentage(this.feature, this.percentage);
        } else {
            client.activate(this.feature);
        }

        System.out.println("Done...");
    }
}
