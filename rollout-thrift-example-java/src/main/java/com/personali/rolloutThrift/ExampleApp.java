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
        client.activateGroup("something", "affiliate_id");
        client.isActiveForGroup("as", "sds");

        client.isActive("something");
        System.out.println(client.multiGet(Arrays.asList("nuni", "batel")));
    }


}
