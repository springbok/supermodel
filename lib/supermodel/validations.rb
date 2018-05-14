module SuperModel
  module Validations
    module Prepend

      def save(options = nil)
        perform_validation = case options
        when Hash
          options[:validate] != false
        when NilClass
          true
        else
          options
        end

        if perform_validation && valid? || !perform_validation
          super
          true
        else
          false
        end
      rescue InvalidRecord => error
        false
      end

    end
  end
end

module SuperModel
  module Validations
    extend  ActiveSupport::Concern
    include ActiveModel::Validations
    prepend SuperModel::Validations::Prepend
  end
end

require "supermodel/validations/uniqueness"