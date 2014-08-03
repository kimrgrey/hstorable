module Hstorable
  module SimpleFields
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
  end
end