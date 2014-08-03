require 'hstorable/model'

module Hstorable
  def self.included(base)
    base.extend Hstorable::Base
    base.extend Hstorable::SimpleFields
    base.extend Hstorable::ModelFields
  end
end
