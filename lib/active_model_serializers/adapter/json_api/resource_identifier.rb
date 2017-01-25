module ActiveModelSerializers
  module Adapter
    class JsonApi
      class ResourceIdentifier
        # {http://jsonapi.org/format/#document-resource-identifier-objects Resource Identifier Objects}
        def initialize(serializer, options)
          puts "\n\ActiveModelSerializers::Adapter::JsonApi::ResourceIdentifier:7 REQUEST...#{DateTime.now.strftime('%Q')}\n\n"
          @id   = id_for(serializer)
          puts "\n\ActiveModelSerializers::Adapter::JsonApi::ResourceIdentifier:9 REQUEST...#{DateTime.now.strftime('%Q')}\n\n"
          tt = type_for(serializer)
          puts "\n\ActiveModelSerializers::Adapter::JsonApi::ResourceIdentifier:11 REQUEST...#{DateTime.now.strftime('%Q')}\n\n"
          @type = JsonApi.send(:transform_key_casing!, tt,options)
          puts "\n\ActiveModelSerializers::Adapter::JsonApi::ResourceIdentifier:13 REQUEST...#{DateTime.now.strftime('%Q')}\n\n"
        end

        def as_json
          puts "\n\ActiveModelSerializers::Adapter::JsonApi::ResourceIdentifier:17 REQUEST...#{DateTime.now.strftime('%Q')}\n\n"
          v = { id: id, type: type }
          puts "\n\ActiveModelSerializers::Adapter::JsonApi::ResourceIdentifier:19 REQUEST...#{DateTime.now.strftime('%Q')}\n\n"
          v
        end

        protected

        attr_reader :id, :type

        private

        def type_for(serializer)
          return serializer._type if serializer._type
          if ActiveModelSerializers.config.jsonapi_resource_type == :singular
            serializer.object.class.model_name.singular
          else
            serializer.object.class.model_name.plural
          end
        end

        def id_for(serializer)
          serializer.read_attribute_for_serialization(:id).to_s
        end
      end
    end
  end
end
