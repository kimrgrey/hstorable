module Hstorable
  module Base
    def hstore_register_field(name, options)
      @hstore_fields ||= []
      @hstore_fields << { name: name }.merge(options)
    end

    def hstore_field_names
      @hstore_fields ||= []
      @hstore_fields.map { |field| field[:name] }
    end

    def hstore_readonly_field?(name)
      options = hstore_options_for_field(name)
      options && options[:readonly]
    end

    def hstore_options_for_field(name)
      @hstore_fields ||= []
      @hstore_fields.find { |field| field[:name] == name }
    end
  end
end