#!/usr/bin/ruby

require "rollout"
require "redis"
require "rollout-thrift/thrift/t_rollout_thrift_service"
require "rollout-thrift/thrift/rollout-thrift_types"
require "thrift/server/thin_http_server"
require 'logstash-logger'
require "rubygems"

$spec = Gem::Specification::load("rollout-thrift.gemspec")
$stdout.sync = true
$logger = LogStashLogger.new(type: :stdout)

# logger configuration, add static metadata fields on every log
config = LogStashLogger.configure do |config|
  config.customize_event do |event|
    event["app_name"] = $spec.name
    event["app_version"] = $spec.version
  end
end

class RolloutThrift

    def initialize(options = {})
        $options = options
    end

    class RolloutThriftServiceHandler
        
        def initialize(redis_url="redis://localhost:6379")
            $logger.info "Initializing Rollout Application connecting to Redis: [#{redis_url}]"
            $redis = Redis.new(url: redis_url)
            $rollout = Rollout.new($redis)
        end

        def isActive(feature)
            begin
                # $logger.debug "Checking isActive for feature [#{feature}]"
                $rollout.active?(feature)
            rescue Exception => e
                meassge = "Exception in 'isActive' with feature [#{feature}], message: [#{e.message}]"
                $logger.error "[#{meassge}], Stack trace: #{e.backtrace.map {|l| "  #{l}\n"}.join}"
                raise ::Com::Personali::RolloutThrift::TRolloutThriftServiceException.new("#{meassge}")
            end
        end

        def isActiveForUser(feature, user)
            begin
                # $logger.debug "Checking isActiveForUser for feature [#{feature}] and user: [#{user}]"
                $rollout.active?(feature, user) 
            rescue Exception => e
                meassge = "Exception in 'isActiveForUser' with feature: [#{feature}] and user: [#{user}], message: [#{e.message}]"
                $logger.error "[#{meassge}], Stack trace: #{e.backtrace.map {|l| "  #{l}\n"}.join}"
                raise ::Com::Personali::RolloutThrift::TRolloutThriftServiceException.new("#{meassge}")
            end            
        end

        def activate(feature)
            begin
                # $logger.debug "Activate feature [#{feature}]"
                $rollout.activate(feature)
            rescue Exception => e
                meassge = "Exception in 'activate' with feature: [#{feature}] , message: [#{e.message}]"
                $logger.error "[#{meassge}], Stack trace: #{e.backtrace.map {|l| "  #{l}\n"}.join}"
                raise ::Com::Personali::RolloutThrift::TRolloutThriftServiceException.new("#{meassge}")
            end                 
        end

        def deactivate(feature)
            begin
                # $logger.debug "Deactivate feature #{feature}"
                $rollout.deactivate(feature) 
            rescue Exception => e
                meassge = "Exception in 'deactivate' with feature: [#{feature}] , message: [#{e.message}]"
                $logger.error "[#{meassge}], Stack trace: #{e.backtrace.map {|l| "  #{l}\n"}.join}"
                raise ::Com::Personali::RolloutThrift::TRolloutThriftServiceException.new("#{meassge}")
            end  
        end

        def activatePercentage(feature, percentage)
            begin
                # $logger.debug "ActivatePercentage feature [#{feature}] and percentage [#{percentage}]"
                $rollout.activate_percentage(feature, percentage)
            rescue Exception => e
                meassge = "Exception in 'deactivate' with feature: [#{feature}] , message: [#{e.message}]"
                $logger.error "[#{meassge}], Stack trace: #{e.backtrace.map {|l| "  #{l}\n"}.join}"
                raise ::Com::Personali::RolloutThrift::TRolloutThriftServiceException.new("#{meassge}")
            end 
        end

        def deactivatePercentage(feature)
            begin
                # $logger.debug "DeactivatePercentage feature [#{feature}]"
                $rollout.deactivate_percentage(feature)
            rescue Exception => e
                meassge = "Exception in 'deactivatePercentage' with feature: [#{feature}] , message: [#{e.message}]"
                $logger.error "[#{meassge}], Stack trace: #{e.backtrace.map {|l| "  #{l}\n"}.join}"
                raise ::Com::Personali::RolloutThrift::TRolloutThriftServiceException.new("#{meassge}")
            end 
        end

        def activateUser(feature, userId)
            begin
                # $logger.debug "ActivateUser feature [#{feature}] and user: [#{userId}]"
                $rollout.activate_user(feature, userId)
            rescue Exception => e
                meassge = "Exception in 'activateUser' with feature: [#{feature}] and user: [#{userId}] , message: [#{e.message}]"
                $logger.error "[#{meassge}], Stack trace: #{e.backtrace.map {|l| "  #{l}\n"}.join}"
                raise ::Com::Personali::RolloutThrift::TRolloutThriftServiceException.new("#{meassge}")
            end
        end

        def deactivateUser(feature, userId)
            begin
                # $logger.debug "DeactivateUser feature [#{feature}] and user: [#{userId}]"
                $rollout.deactivate_user(feature, userId)
            rescue Exception => e
                meassge = "Exception in 'deactivateUser' with feature: [#{feature}] and user: [#{userId}] , message: [#{e.message}]"
                $logger.error "[#{meassge}], Stack trace: #{e.backtrace.map {|l| "  #{l}\n"}.join}"
                raise ::Com::Personali::RolloutThrift::TRolloutThriftServiceException.new("#{meassge}")
            end
        end

        def get(feature)
            begin
                # $logger.debug "Get feature [#{feature}]"
                r_feature_to_t_feature($rollout.get(feature))
            rescue Exception => e
                meassge = "Exception in 'get' with feature: [#{feature}], message: [#{e.message}]"
                $logger.error "[#{meassge}], Stack trace: #{e.backtrace.map {|l| "  #{l}\n"}.join}"
                raise ::Com::Personali::RolloutThrift::TRolloutThriftServiceException.new("#{meassge}")
            end            
        end

        def getAll()
            begin
                # $logger.debug "Get All Features"
                multiGet($rollout.features)
            rescue Exception => e
                meassge = "Exception in 'getAll', message: [#{e.message}]"
                $logger.error "[#{meassge}], Stack trace: #{e.backtrace.map {|l| "  #{l}\n"}.join}"
                raise ::Com::Personali::RolloutThrift::TRolloutThriftServiceException.new("#{meassge}")
            end             
        end

        def getAllActive()
            begin
                # $logger.debug "Get All Active Features"
                $rollout.multi_get(*$rollout.active_features).map do |feature|
                    r_feature_to_t_feature(feature)
                end
            rescue Exception => e
                meassge = "Exception in 'getAllActive', message: [#{e.message}]"
                $logger.error "[#{meassge}], Stack trace: #{e.backtrace.map {|l| "  #{l}\n"}.join}"
                raise ::Com::Personali::RolloutThrift::TRolloutThriftServiceException.new("#{meassge}")
            end              
        end

        def getAllActiveForUser(userId)
            begin
                # $logger.debug "Get All Active Features for user [#{userId}]"
                $rollout.multi_get(*$rollout.active_features(userId)).map do |feature|
                    r_feature_to_t_feature(feature)
                end
            rescue Exception => e
                meassge = "Exception in 'getAllActiveForUser' with user [#{userId}], message: [#{e.message}]"
                $logger.error "[#{meassge}], Stack trace: #{e.backtrace.map {|l| "  #{l}\n"}.join}"
                raise ::Com::Personali::RolloutThrift::TRolloutThriftServiceException.new("#{meassge}")
            end
        end

        def multiGet(features)
            begin
                # $logger.debug "Get features [#{features}]"
                $rollout.multi_get(*features).map do |feature|
                    r_feature_to_t_feature(feature)
                end                  
            rescue Exception => e
                meassge = "Exception in 'multiGet' with features [#{features}], message: [#{e.message}]"
                $logger.error "[#{meassge}], Stack trace: #{e.backtrace.map {|l| "  #{l}\n"}.join}"
                raise ::Com::Personali::RolloutThrift::TRolloutThriftServiceException.new("#{meassge}")
            end

        end

        def delete(feature)
            begin
                # $logger.debug "Delete feature [#{feature}]"
                $rollout.delete(feature)
            rescue Exception => e
                meassge = "Exception in 'delete' with features [#{feature}], message: [#{e.message}]"
                $logger.error "[#{meassge}], Stack trace: #{e.backtrace.map {|l| "  #{l}\n"}.join}"
                raise ::Com::Personali::RolloutThrift::TRolloutThriftServiceException.new("#{meassge}")
            end
        end
        
        def activateGroup(feature, group)
            begin
                # $logger.debug "ActivateGroup feature [#{feature}] and group: [#{group}]"
                $rollout.activate_group(feature, group)
            rescue Exception => e
                meassge = "Exception in 'activateGroup' with features [#{feature}] and group [#{group}], message: [#{e.message}]"
                $logger.error "[#{meassge}], Stack trace: #{e.backtrace.map {|l| "  #{l}\n"}.join}"
                raise ::Com::Personali::RolloutThrift::TRolloutThriftServiceException.new("#{meassge}")
            end
        end

        def deactivateGroup(feature, group)            
            begin
                # $logger.debug "DeactivateGroup feature [#{feature}] and group: [#{group}]"
                $rollout.deactivate_group(feature, group)
            rescue Exception => e
                meassge = "Exception in 'deactivateGroup' with features [#{feature}] and group [#{group}], message: [#{e.message}]"
                $logger.error "[#{meassge}], Stack trace: #{e.backtrace.map {|l| "  #{l}\n"}.join}"
                raise ::Com::Personali::RolloutThrift::TRolloutThriftServiceException.new("#{meassge}")
            end            
        end

        private 
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

    end

    def startServer()
        begin
            handler = RolloutThriftServiceHandler.new($options[:redis_url])
            processor = Com::Personali::RolloutThrift::TRolloutThriftService::Processor.new(handler)
            server = Thrift::ThinHTTPServer.new(processor, {:port=>$options[:port]})

            $logger.info "Starting thrift server.."
            server.serve()
            $logger.info "App closed"
        rescue Exception => e
            $logger.error "Caught Exception while starting service #{e}"
        end
    end
end