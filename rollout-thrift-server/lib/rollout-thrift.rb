require "rollout"
require "redis"
require "rollout-thrift/thrift/t_rollout_thrift_service"
require "rollout-thrift/thrift/rollout-thrift_types"
require "thrift/server/thin_http_server"


class RolloutThrift

    def initialize(options = {})
        $options = options
    end

    class RolloutThriftServiceHandler

        def initialize(redis_url="redis://localhost:6379")
            $redis = Redis.new(url: redis_url)
            $rollout = Rollout.new($redis)
        end

        def isActive(feature)
            $rollout.active?(feature) 
        end

        def isActiveForUser(feature, user)
            $rollout.active?(feature, user) 
        end

        def activate(feature)
            $rollout.activate(feature) 
        end

        def activatePercentage(feature, percentage)
            $rollout.activate_percentage(feature, percentage) 
        end

        def get(feature)
            r_feature_to_t_feature($rollout.get(feature))
        end

        def t_feature_to_r_feature(t_feature)
            r_feature = Rollout::Feature.new(t_feature.name.to_sym)
            r_feature.percentage = t_feature.percentage
            r_feature.groups = t_feature.groups.map(&:to_sym)
            r_feature.users = t_feature.users.map(&:to_sym)
            r_feature
        end

        def r_feature_to_t_feature(r_feature)
            Com::Personali::RolloutThrift::TFeature.new({:name => r_feature.name.to_s,
                                                         :percentage => r_feature.percentage,
                                                         :groups => r_feature.groups.map(&:to_s),
                                                         :users  => r_feature.users.map(&:to_s)
            })
        end

        def multiGet(features)
            $rollout.multi_get(*features).map do |feature|
                r_feature_to_t_feature(feature)
            end
        end

        def activeFeatures()
            $rollout.active_features.map(&:to_s)
        end

        def activeFeaturesForUser(userId)
            $rollout.active_features(userId).map(&:to_s)
        end

        def delete(feature)
            $rollout.delete(feature)
        end
        
        def activateGroup(feature, group)
            $rollout.activate_group(feature, group)
        end

        def deactivateGroup(feature, group)
            $rollout.deactivate_group(feature, group)
        end

    end

    def startServer()
        handler = RolloutThriftServiceHandler.new($options[:redis_url])
        processor = Com::Personali::RolloutThrift::TRolloutThriftService::Processor.new(handler)
        server = Thrift::ThinHTTPServer.new(processor, {:port=>$options[:port]})

        puts "Starting thrift server.."
        server.serve()
        puts "Done"
    end
end


