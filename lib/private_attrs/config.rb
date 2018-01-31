module PrivateAttrs
  class Config
    def self.add_private_attrs!
      self.superclass.send(:include, AttrMethods)
    end
  end
end
