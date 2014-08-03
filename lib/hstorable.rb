require 'hstorable/base'
require 'hstorable/simple_fields'
require 'hstorable/model_fields'

module Hstorable
  def self.included(base)
    base.extend Hstorable::Base
    base.extend Hstorable::SimpleFields
    base.extend Hstorable::ModelFields
  end
end
