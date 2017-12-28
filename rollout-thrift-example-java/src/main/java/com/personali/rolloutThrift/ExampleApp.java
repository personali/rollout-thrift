package com.personali.rolloutThrift;

import org.apache.thrift.TException;

import java.util.Arrays;
import java.util.List;

/**
 * Hello world!
 *
 */
public class ExampleApp
{
    public static void main( String[] args ) throws TException {
        TRolloutThriftService.Client client = RolloutThriftClientFactory.create("http://localhost:9090/");
        client.activate("f1");
        client.isActive("f1");
    }


}
