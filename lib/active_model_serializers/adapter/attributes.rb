module ActiveModelSerializers
  module Adapter
    class Attributes < Base
      def serializable_hash(options = nil)
        puts "\n\ActiveModelSerializers::Adapter::Base:5 REQUEST...#{DateTime.now.strftime('%Q')}\n\n"
        options = serialization_options(options)
        puts "\n\ActiveModelSerializers::Adapter::Base:7 REQUEST...#{DateTime.now.strftime('%Q')}\n\n"
        options[:fields] ||= instance_options[:fields]
        puts "\n\ActiveModelSerializers::Adapter::Base:9 REQUEST...#{DateTime.now.strftime('%Q')}\n\n"
        s = serializer.serializable_hash(instance_options, options, self)
        puts "\n\ActiveModelSerializers::Adapter::Base:11 REQUEST...#{DateTime.now.strftime('%Q')}\n\n"
        s
      end
    end
  end
end
