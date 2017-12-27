package com.personali.rolloutThrift;

import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.transport.THttpClient;
import org.apache.thrift.transport.TTransportException;

public class RolloutThriftClientFactory{

    public static TRolloutThriftService.Client create(String host) throws TTransportException {
        THttpClient httpClient = new THttpClient(host);
        TBinaryProtocol protocol = new TBinaryProtocol(httpClient);
        return new TRolloutThriftService.Client(protocol);
    }

}