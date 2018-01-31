require 'private_attrs/version'
require 'private_attrs/config'
require 'private_attrs/attr_methods'

module PrivateAttrs
  PrivateAttrs::Config.add_private_attrs!
end
