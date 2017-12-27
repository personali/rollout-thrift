package com.personali.rolloutThrift.cli;

import com.beust.jcommander.Parameter;
import com.beust.jcommander.Parameters;

public class CommandMain {

    @Parameter(names={"--host"}, description = "Host of Rollout Thrift server", required = true)
    public String host;
}
