package com.personali.rolloutThrift;

import com.personali.rolloutThrift.RolloutThriftClientFactory;
import com.personali.rolloutThrift.RolloutThriftService;
import org.apache.thrift.TException;

/**
 * Hello world!
 *
 */
public class ExampleApp
{
    public static void main( String[] args ) throws TException {

        RolloutThriftService.Client client = RolloutThriftClientFactory.create("http://localhost:9090/");
        client.activate("b");
        if(client.isActive("b")){

        }

        System.out.println( client.isActive("cb"));
    }
}
