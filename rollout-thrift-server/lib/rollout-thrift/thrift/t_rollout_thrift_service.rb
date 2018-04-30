#
# Autogenerated by Thrift Compiler (0.10.0)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'rollout-thrift_types'

module Com
  module Personali
    module RolloutThrift
      module TRolloutThriftService
        class Client
          include ::Thrift::Client

          def isActive(feature)
            send_isActive(feature)
            return recv_isActive()
          end

          def send_isActive(feature)
            send_message('isActive', IsActive_args, :feature => feature)
          end

          def recv_isActive()
            result = receive_message(IsActive_result)
            return result.success unless result.success.nil?
            raise result.e unless result.e.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'isActive failed: unknown result')
          end

          def isActiveForUser(feature, userId)
            send_isActiveForUser(feature, userId)
            return recv_isActiveForUser()
          end

          def send_isActiveForUser(feature, userId)
            send_message('isActiveForUser', IsActiveForUser_args, :feature => feature, :userId => userId)
          end

          def recv_isActiveForUser()
            result = receive_message(IsActiveForUser_result)
            return result.success unless result.success.nil?
            raise result.e unless result.e.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'isActiveForUser failed: unknown result')
          end

          def activate(feature)
            send_activate(feature)
            recv_activate()
          end

          def send_activate(feature)
            send_message('activate', Activate_args, :feature => feature)
          end

          def recv_activate()
            result = receive_message(Activate_result)
            raise result.e unless result.e.nil?
            return
          end

          def deactivate(feature)
            send_deactivate(feature)
            recv_deactivate()
          end

          def send_deactivate(feature)
            send_message('deactivate', Deactivate_args, :feature => feature)
          end

          def recv_deactivate()
            result = receive_message(Deactivate_result)
            raise result.e unless result.e.nil?
            return
          end

          def activateUser(feature, userId)
            send_activateUser(feature, userId)
            recv_activateUser()
          end

          def send_activateUser(feature, userId)
            send_message('activateUser', ActivateUser_args, :feature => feature, :userId => userId)
          end

          def recv_activateUser()
            result = receive_message(ActivateUser_result)
            raise result.e unless result.e.nil?
            return
          end

          def deactivateUser(feature, userId)
            send_deactivateUser(feature, userId)
            recv_deactivateUser()
          end

          def send_deactivateUser(feature, userId)
            send_message('deactivateUser', DeactivateUser_args, :feature => feature, :userId => userId)
          end

          def recv_deactivateUser()
            result = receive_message(DeactivateUser_result)
            raise result.e unless result.e.nil?
            return
          end

          def activatePercentage(feature, percentage)
            send_activatePercentage(feature, percentage)
            recv_activatePercentage()
          end

          def send_activatePercentage(feature, percentage)
            send_message('activatePercentage', ActivatePercentage_args, :feature => feature, :percentage => percentage)
          end

          def recv_activatePercentage()
            result = receive_message(ActivatePercentage_result)
            raise result.e unless result.e.nil?
            return
          end

          def deactivatePercentage(feature)
            send_deactivatePercentage(feature)
            recv_deactivatePercentage()
          end

          def send_deactivatePercentage(feature)
            send_message('deactivatePercentage', DeactivatePercentage_args, :feature => feature)
          end

          def recv_deactivatePercentage()
            result = receive_message(DeactivatePercentage_result)
            raise result.e unless result.e.nil?
            return
          end

          def get(feature)
            send_get(feature)
            return recv_get()
          end

          def send_get(feature)
            send_message('get', Get_args, :feature => feature)
          end

          def recv_get()
            result = receive_message(Get_result)
            return result.success unless result.success.nil?
            raise result.e unless result.e.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'get failed: unknown result')
          end

          def getAll()
            send_getAll()
            return recv_getAll()
          end

          def send_getAll()
            send_message('getAll', GetAll_args)
          end

          def recv_getAll()
            result = receive_message(GetAll_result)
            return result.success unless result.success.nil?
            raise result.e unless result.e.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getAll failed: unknown result')
          end

          def getAllActive()
            send_getAllActive()
            return recv_getAllActive()
          end

          def send_getAllActive()
            send_message('getAllActive', GetAllActive_args)
          end

          def recv_getAllActive()
            result = receive_message(GetAllActive_result)
            return result.success unless result.success.nil?
            raise result.e unless result.e.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getAllActive failed: unknown result')
          end

          def getAllActiveForUser(userId)
            send_getAllActiveForUser(userId)
            return recv_getAllActiveForUser()
          end

          def send_getAllActiveForUser(userId)
            send_message('getAllActiveForUser', GetAllActiveForUser_args, :userId => userId)
          end

          def recv_getAllActiveForUser()
            result = receive_message(GetAllActiveForUser_result)
            return result.success unless result.success.nil?
            raise result.e unless result.e.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getAllActiveForUser failed: unknown result')
          end

          def multiGet(features)
            send_multiGet(features)
            return recv_multiGet()
          end

          def send_multiGet(features)
            send_message('multiGet', MultiGet_args, :features => features)
          end

          def recv_multiGet()
            result = receive_message(MultiGet_result)
            return result.success unless result.success.nil?
            raise result.e unless result.e.nil?
            raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'multiGet failed: unknown result')
          end

          def deleteFeature(feature)
            send_deleteFeature(feature)
            recv_deleteFeature()
          end

          def send_deleteFeature(feature)
            send_message('deleteFeature', DeleteFeature_args, :feature => feature)
          end

          def recv_deleteFeature()
            result = receive_message(DeleteFeature_result)
            raise result.e unless result.e.nil?
            return
          end

          def activateGroup(feature, group)
            send_activateGroup(feature, group)
            recv_activateGroup()
          end

          def send_activateGroup(feature, group)
            send_message('activateGroup', ActivateGroup_args, :feature => feature, :group => group)
          end

          def recv_activateGroup()
            result = receive_message(ActivateGroup_result)
            raise result.e unless result.e.nil?
            return
          end

          def deactivateGroup(feature, group)
            send_deactivateGroup(feature, group)
            recv_deactivateGroup()
          end

          def send_deactivateGroup(feature, group)
            send_message('deactivateGroup', DeactivateGroup_args, :feature => feature, :group => group)
          end

          def recv_deactivateGroup()
            result = receive_message(DeactivateGroup_result)
            raise result.e unless result.e.nil?
            return
          end

        end

        class Processor
          include ::Thrift::Processor

          def process_isActive(seqid, iprot, oprot)
            args = read_args(iprot, IsActive_args)
            result = IsActive_result.new()
            begin
              result.success = @handler.isActive(args.feature)
            rescue ::Com::Personali::RolloutThrift::TRolloutThriftServiceException => e
              result.e = e
            end
            write_result(result, oprot, 'isActive', seqid)
          end

          def process_isActiveForUser(seqid, iprot, oprot)
            args = read_args(iprot, IsActiveForUser_args)
            result = IsActiveForUser_result.new()
            begin
              result.success = @handler.isActiveForUser(args.feature, args.userId)
            rescue ::Com::Personali::RolloutThrift::TRolloutThriftServiceException => e
              result.e = e
            end
            write_result(result, oprot, 'isActiveForUser', seqid)
          end

          def process_activate(seqid, iprot, oprot)
            args = read_args(iprot, Activate_args)
            result = Activate_result.new()
            begin
              @handler.activate(args.feature)
            rescue ::Com::Personali::RolloutThrift::TRolloutThriftServiceException => e
              result.e = e
            end
            write_result(result, oprot, 'activate', seqid)
          end

          def process_deactivate(seqid, iprot, oprot)
            args = read_args(iprot, Deactivate_args)
            result = Deactivate_result.new()
            begin
              @handler.deactivate(args.feature)
            rescue ::Com::Personali::RolloutThrift::TRolloutThriftServiceException => e
              result.e = e
            end
            write_result(result, oprot, 'deactivate', seqid)
          end

          def process_activateUser(seqid, iprot, oprot)
            args = read_args(iprot, ActivateUser_args)
            result = ActivateUser_result.new()
            begin
              @handler.activateUser(args.feature, args.userId)
            rescue ::Com::Personali::RolloutThrift::TRolloutThriftServiceException => e
              result.e = e
            end
            write_result(result, oprot, 'activateUser', seqid)
          end

          def process_deactivateUser(seqid, iprot, oprot)
            args = read_args(iprot, DeactivateUser_args)
            result = DeactivateUser_result.new()
            begin
              @handler.deactivateUser(args.feature, args.userId)
            rescue ::Com::Personali::RolloutThrift::TRolloutThriftServiceException => e
              result.e = e
            end
            write_result(result, oprot, 'deactivateUser', seqid)
          end

          def process_activatePercentage(seqid, iprot, oprot)
            args = read_args(iprot, ActivatePercentage_args)
            result = ActivatePercentage_result.new()
            begin
              @handler.activatePercentage(args.feature, args.percentage)
            rescue ::Com::Personali::RolloutThrift::TRolloutThriftServiceException => e
              result.e = e
            end
            write_result(result, oprot, 'activatePercentage', seqid)
          end

          def process_deactivatePercentage(seqid, iprot, oprot)
            args = read_args(iprot, DeactivatePercentage_args)
            result = DeactivatePercentage_result.new()
            begin
              @handler.deactivatePercentage(args.feature)
            rescue ::Com::Personali::RolloutThrift::TRolloutThriftServiceException => e
              result.e = e
            end
            write_result(result, oprot, 'deactivatePercentage', seqid)
          end

          def process_get(seqid, iprot, oprot)
            args = read_args(iprot, Get_args)
            result = Get_result.new()
            begin
              result.success = @handler.get(args.feature)
            rescue ::Com::Personali::RolloutThrift::TRolloutThriftServiceException => e
              result.e = e
            end
            write_result(result, oprot, 'get', seqid)
          end

          def process_getAll(seqid, iprot, oprot)
            args = read_args(iprot, GetAll_args)
            result = GetAll_result.new()
            begin
              result.success = @handler.getAll()
            rescue ::Com::Personali::RolloutThrift::TRolloutThriftServiceException => e
              result.e = e
            end
            write_result(result, oprot, 'getAll', seqid)
          end

          def process_getAllActive(seqid, iprot, oprot)
            args = read_args(iprot, GetAllActive_args)
            result = GetAllActive_result.new()
            begin
              result.success = @handler.getAllActive()
            rescue ::Com::Personali::RolloutThrift::TRolloutThriftServiceException => e
              result.e = e
            end
            write_result(result, oprot, 'getAllActive', seqid)
          end

          def process_getAllActiveForUser(seqid, iprot, oprot)
            args = read_args(iprot, GetAllActiveForUser_args)
            result = GetAllActiveForUser_result.new()
            begin
              result.success = @handler.getAllActiveForUser(args.userId)
            rescue ::Com::Personali::RolloutThrift::TRolloutThriftServiceException => e
              result.e = e
            end
            write_result(result, oprot, 'getAllActiveForUser', seqid)
          end

          def process_multiGet(seqid, iprot, oprot)
            args = read_args(iprot, MultiGet_args)
            result = MultiGet_result.new()
            begin
              result.success = @handler.multiGet(args.features)
            rescue ::Com::Personali::RolloutThrift::TRolloutThriftServiceException => e
              result.e = e
            end
            write_result(result, oprot, 'multiGet', seqid)
          end

          def process_deleteFeature(seqid, iprot, oprot)
            args = read_args(iprot, DeleteFeature_args)
            result = DeleteFeature_result.new()
            begin
              @handler.deleteFeature(args.feature)
            rescue ::Com::Personali::RolloutThrift::TRolloutThriftServiceException => e
              result.e = e
            end
            write_result(result, oprot, 'deleteFeature', seqid)
          end

          def process_activateGroup(seqid, iprot, oprot)
            args = read_args(iprot, ActivateGroup_args)
            result = ActivateGroup_result.new()
            begin
              @handler.activateGroup(args.feature, args.group)
            rescue ::Com::Personali::RolloutThrift::TRolloutThriftServiceException => e
              result.e = e
            end
            write_result(result, oprot, 'activateGroup', seqid)
          end

          def process_deactivateGroup(seqid, iprot, oprot)
            args = read_args(iprot, DeactivateGroup_args)
            result = DeactivateGroup_result.new()
            begin
              @handler.deactivateGroup(args.feature, args.group)
            rescue ::Com::Personali::RolloutThrift::TRolloutThriftServiceException => e
              result.e = e
            end
            write_result(result, oprot, 'deactivateGroup', seqid)
          end

        end

        # HELPER FUNCTIONS AND STRUCTURES

        class IsActive_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          FEATURE = 1

          FIELDS = {
            FEATURE => {:type => ::Thrift::Types::STRING, :name => 'feature'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class IsActive_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0
          E = 1

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'},
            E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::Com::Personali::RolloutThrift::TRolloutThriftServiceException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class IsActiveForUser_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          FEATURE = 1
          USERID = 2

          FIELDS = {
            FEATURE => {:type => ::Thrift::Types::STRING, :name => 'feature'},
            USERID => {:type => ::Thrift::Types::STRING, :name => 'userId'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class IsActiveForUser_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0
          E = 1

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::BOOL, :name => 'success'},
            E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::Com::Personali::RolloutThrift::TRolloutThriftServiceException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class Activate_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          FEATURE = 1

          FIELDS = {
            FEATURE => {:type => ::Thrift::Types::STRING, :name => 'feature'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class Activate_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          E = 1

          FIELDS = {
            E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::Com::Personali::RolloutThrift::TRolloutThriftServiceException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class Deactivate_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          FEATURE = 1

          FIELDS = {
            FEATURE => {:type => ::Thrift::Types::STRING, :name => 'feature'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class Deactivate_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          E = 1

          FIELDS = {
            E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::Com::Personali::RolloutThrift::TRolloutThriftServiceException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class ActivateUser_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          FEATURE = 1
          USERID = 2

          FIELDS = {
            FEATURE => {:type => ::Thrift::Types::STRING, :name => 'feature'},
            USERID => {:type => ::Thrift::Types::STRING, :name => 'userId'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class ActivateUser_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          E = 1

          FIELDS = {
            E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::Com::Personali::RolloutThrift::TRolloutThriftServiceException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class DeactivateUser_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          FEATURE = 1
          USERID = 2

          FIELDS = {
            FEATURE => {:type => ::Thrift::Types::STRING, :name => 'feature'},
            USERID => {:type => ::Thrift::Types::STRING, :name => 'userId'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class DeactivateUser_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          E = 1

          FIELDS = {
            E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::Com::Personali::RolloutThrift::TRolloutThriftServiceException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class ActivatePercentage_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          FEATURE = 1
          PERCENTAGE = 2

          FIELDS = {
            FEATURE => {:type => ::Thrift::Types::STRING, :name => 'feature'},
            PERCENTAGE => {:type => ::Thrift::Types::I32, :name => 'percentage'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class ActivatePercentage_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          E = 1

          FIELDS = {
            E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::Com::Personali::RolloutThrift::TRolloutThriftServiceException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class DeactivatePercentage_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          FEATURE = 1

          FIELDS = {
            FEATURE => {:type => ::Thrift::Types::STRING, :name => 'feature'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class DeactivatePercentage_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          E = 1

          FIELDS = {
            E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::Com::Personali::RolloutThrift::TRolloutThriftServiceException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class Get_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          FEATURE = 1

          FIELDS = {
            FEATURE => {:type => ::Thrift::Types::STRING, :name => 'feature'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class Get_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0
          E = 1

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::Com::Personali::RolloutThrift::TFeature},
            E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::Com::Personali::RolloutThrift::TRolloutThriftServiceException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class GetAll_args
          include ::Thrift::Struct, ::Thrift::Struct_Union

          FIELDS = {

          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class GetAll_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0
          E = 1

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::LIST, :name => 'success', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Com::Personali::RolloutThrift::TFeature}},
            E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::Com::Personali::RolloutThrift::TRolloutThriftServiceException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class GetAllActive_args
          include ::Thrift::Struct, ::Thrift::Struct_Union

          FIELDS = {

          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class GetAllActive_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0
          E = 1

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::LIST, :name => 'success', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Com::Personali::RolloutThrift::TFeature}},
            E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::Com::Personali::RolloutThrift::TRolloutThriftServiceException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class GetAllActiveForUser_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          USERID = 1

          FIELDS = {
            USERID => {:type => ::Thrift::Types::STRING, :name => 'userId'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class GetAllActiveForUser_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0
          E = 1

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::LIST, :name => 'success', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Com::Personali::RolloutThrift::TFeature}},
            E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::Com::Personali::RolloutThrift::TRolloutThriftServiceException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class MultiGet_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          FEATURES = 1

          FIELDS = {
            FEATURES => {:type => ::Thrift::Types::LIST, :name => 'features', :element => {:type => ::Thrift::Types::STRING}}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class MultiGet_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          SUCCESS = 0
          E = 1

          FIELDS = {
            SUCCESS => {:type => ::Thrift::Types::LIST, :name => 'success', :element => {:type => ::Thrift::Types::STRUCT, :class => ::Com::Personali::RolloutThrift::TFeature}},
            E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::Com::Personali::RolloutThrift::TRolloutThriftServiceException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class DeleteFeature_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          FEATURE = 1

          FIELDS = {
            FEATURE => {:type => ::Thrift::Types::STRING, :name => 'feature'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class DeleteFeature_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          E = 1

          FIELDS = {
            E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::Com::Personali::RolloutThrift::TRolloutThriftServiceException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class ActivateGroup_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          FEATURE = 1
          GROUP = 2

          FIELDS = {
            FEATURE => {:type => ::Thrift::Types::STRING, :name => 'feature'},
            GROUP => {:type => ::Thrift::Types::STRING, :name => 'group'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class ActivateGroup_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          E = 1

          FIELDS = {
            E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::Com::Personali::RolloutThrift::TRolloutThriftServiceException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class DeactivateGroup_args
          include ::Thrift::Struct, ::Thrift::Struct_Union
          FEATURE = 1
          GROUP = 2

          FIELDS = {
            FEATURE => {:type => ::Thrift::Types::STRING, :name => 'feature'},
            GROUP => {:type => ::Thrift::Types::STRING, :name => 'group'}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

        class DeactivateGroup_result
          include ::Thrift::Struct, ::Thrift::Struct_Union
          E = 1

          FIELDS = {
            E => {:type => ::Thrift::Types::STRUCT, :name => 'e', :class => ::Com::Personali::RolloutThrift::TRolloutThriftServiceException}
          }

          def struct_fields; FIELDS; end

          def validate
          end

          ::Thrift::Struct.generate_accessors self
        end

      end

    end
  end
end
