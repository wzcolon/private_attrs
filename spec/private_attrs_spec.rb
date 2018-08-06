RSpec.describe PrivateAttrs do
  describe 'private_attr_reader' do
    specify 'creates a private reader method on an object' do
      class TestClass
        private_attr_reader :foo

        def foo=(value)
          @foo = value
        end
      end

      instance = TestClass.new
      instance.foo = 'foo'

      expect{ instance.foo }.to raise_error(NoMethodError)
      expect{ instance.send(:foo) }.to_not raise_error
      expect(instance.send(:foo)).to eq 'foo'
    end
  end

  describe 'private_attr_writer' do
    specify 'creates a private writer method on an object' do
      class TestClass
        private_attr_writer :foo

        def foo
          @foo
        end
      end

      instance = TestClass.new

      expect{ instance.foo = 'foo' }.to raise_error(NoMethodError)
      expect{ instance.send(:foo=, 'foo') }.to_not raise_error

      instance.send(:foo=, 'foo')
      expect(instance.foo).to eq 'foo'
    end
  end

  describe 'private_attr_accessor' do
    specify 'creates a private reader method on an object' do
      class TestClass
        private_attr_accessor :foo

        def foo=(value)
          @foo = value
        end
      end

      instance = TestClass.new
      instance.foo = 'foo'

      expect{ instance.foo }.to raise_error(NoMethodError)
      expect{ instance.send(:foo) }.to_not raise_error
      expect(instance.send(:foo)).to eq 'foo'
    end

    specify 'creates a private writer method on an object' do
      class TestClass
        private_attr_accessor :foo

        def foo
          @foo
        end
      end

      instance = TestClass.new
      expect{ instance.foo = 'foo' }.to raise_error(NoMethodError)

      expect{ instance.send(:foo=, 'foo') }.to_not raise_error
      instance.send(:foo=, 'foo')

      expect(instance.foo).to eq 'foo'
    end
  end
end
