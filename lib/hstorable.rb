require "hstorable/version"

module Hstorable
  def hstore_register_field(name, options)
    @hstore_fields ||= []
    @hstore_fields << { name: name }.merge(options)
  end

  def hstore_field_names
    @hstore_fields.map { |field| field[:name] }
  end

  def hstore_readonly_field?(name)
    options = hstore_options_for_field(name)
    options && options[:readonly]
  end

  def hstore_options_for_field(name)
    @hstore_fields.find { |field| field[:name] == name }
  end

  def hstore_simple(field, options)
    name = options[:name]
    default = options[:default]
    
    define_method "#{name}" do
      hstore = self.send(field)
      value = hstore[name]
      value ? value : default
    end
    
    define_method "#{name}=" do |value|
      hstore = self.send(field)
      self.send("#{field}_will_change!") if hstore[name] != value
      hstore[name] = value
      hstore[name]
    end

    hstore_register_field(name, options)
  end

  def hstore_model(options)
    # TODO Implement handling of model dependencies here
  end

  def hstore(type, field, options)
    case type
      when :simple then hstore_simple(field, options)
      when :model then hstore_model(field, options)
    end
  end
end
