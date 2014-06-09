require 'active_support/core_ext/array/wrap'

module RSpecLets
  module Helper
    def lets(hash)
      hash.each do |keys, value|
        Array.wrap(keys).each_with_index do |key, index|
          define_method key do
            @assignments ||= {}
            if value.arity == 1
              @assignments[key] ||= instance_exec(index, &value)
            elsif value.arity == 2
              @assignments[key] ||= instance_exec(index, key, &value)
            else
              @assignments[key] ||= instance_exec(&value)
            end
          end
        end
      end
    end

    def lets!(hash)
      lets(hash)

      hash.each do |keys, value|
        Array.wrap(keys).each do |key|
          before { __send__(key) }
        end
      end
    end

    def help(hash)
      hash.each do |var, value|
        define_method var do |*args|
          instance_exec(*args, &value)
        end
      end
    end
  end
end
