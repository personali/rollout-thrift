require "rollout"
require "redis"
require "rollout-thrift/thrift/rollout_thrift_service"
require "thrift/server/thin_http_server"


class RolloutThrift

    def initialize(options = {})
        $options = options
    end

    class RolloutThriftServiceHandler

        def initialize(redisUrl="redis://localhost:6379")
            $redis = Redis.new(url: redisUrl)
            $rollout = Rollout.new($redis)
        end

        def isActive(feature)
            $rollout.active?(feature) 
        end

        def activate(feature)
            $rollout.activate(feature) 
        end

    end

    def startServer()
        handler = RolloutThriftServiceHandler.new($options[:redisUrl])
        processor = Com::Personali::RolloutThrift::RolloutThriftService::Processor.new(handler)
        server = Thrift::ThinHTTPServer.new(processor, {:port=>$options[:port]})

        puts "Starting thrift server.."
        server.serve()
        puts "Done"
    end
end


