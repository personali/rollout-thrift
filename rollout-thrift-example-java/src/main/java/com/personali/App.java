package com.personali;

import com.personali.rolloutThrift.RolloutThriftService;
import org.apache.thrift.TException;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.transport.TServerSocket;
import org.apache.thrift.transport.TSocket;

import java.net.InetSocketAddress;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args ) throws TException {
        TSocket socket = new TSocket("localhost", 9090);
        socket.open();
        TBinaryProtocol protocol = new TBinaryProtocol(socket);
        RolloutThriftService.Client client = new RolloutThriftService.Client(protocol);
        client.activate("a");
        System.out.println( client.isActive("b") + "");
    }
}
