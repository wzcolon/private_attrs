module AttrMethods
  def self.included(base)
    base.class_eval do
      def self.private_attr_reader(*args)
        args.each do |arg|
          method_name = arg.to_sym
          attr_reader method_name
          private method_name
        end
      end

      def self.private_attr_writer(*args)
        args.each do |arg|
          method_name = arg.to_sym
          attr_writer method_name
          private "#{method_name}="
        end
      end

      def self.private_attr_accessor(*args)
        args.each do |arg|
          method_name = arg.to_sym
          attr_accessor method_name
          private method_name
          private "#{method_name}="
        end
      end

      def self.protected_attr_reader(*args)
        args.each do |arg|
          method_name = arg.to_sym
          attr_reader method_name
          protected method_name
        end
      end

      def self.protected_attr_writer(*args)
        args.each do |arg|
          method_name = arg.to_sym
          attr_writer method_name
          protected "#{method_name}="
        end
      end

      def self.protected_attr_accessor(*args)
        args.each do |arg|
          method_name = arg.to_sym
          attr_accessor method_name
          protected method_name
          protected "#{method_name}="
        end
      end
    end
  end
end
