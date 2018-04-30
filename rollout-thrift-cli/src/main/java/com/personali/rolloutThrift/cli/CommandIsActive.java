package com.personali.rolloutThrift.cli;

import com.beust.jcommander.Parameter;
import com.beust.jcommander.Parameters;
import com.personali.rolloutThrift.RolloutThriftCacheClient;
import org.apache.thrift.TException;


@Parameters(commandNames = {"is-active"}, commandDescription = "Test if feature is active")
public class CommandIsActive {

    @Parameter(names = {"--feature"}, description = "Get feature by name", required = true)
    public String feature;

    @Parameter(names = {"--user-id"}, description = "Filter by user id", required = false)
    public String userId;


    public void execute(RolloutThriftCacheClient client) throws TException {
        if (this.userId != null) {
            System.out.println(client.isActiveForUser(this.feature, this.userId));
        } else {
            System.out.println(client.isActive(this.feature));
        }
    }
}
