require "rollout"
require "redis"
require "rollout-thrift/thrift/rollout_thrift_service"


class RolloutThrift
    class RolloutThriftServiceHandler
        $redis = Redis.new(host: 'redis')
        $rollout = Rollout.new($redis)

        def isActive(feature)
            $rollout.active?(feature) 
        end

        def activate(feature)
            $rollout.activate(feature) 
        end

    end

    def self.startServer()
        handler = RolloutThriftServiceHandler.new()
        processor = Com::Personali::RolloutThrift::RolloutThriftService::Processor.new(handler)
        transport = Thrift::ServerSocket.new(9090)
        transportFactory = Thrift::BufferedTransportFactory.new()
        server = Thrift::SimpleServer.new(processor, transport, transportFactory)

        puts "Starting thrift server.."
        server.serve()
        puts "Done"
    end
end


