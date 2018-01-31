module AttrMethods
  def self.included(base)
    base.class_eval do
      def self.private_attr_reader(*args)
        args.each do |arg|
          private
          attr_reader arg.to_sym
          public
        end
      end

      def self.private_attr_writer(*args)
        private
        args.each do |arg|
          attr_writer arg.to_sym
        end
        public
      end

      def self.private_attr_accessor(*args)
        private
        args.each do |arg|
          attr_accessor arg.to_sym
        end
        public
      end
    end
  end
end
