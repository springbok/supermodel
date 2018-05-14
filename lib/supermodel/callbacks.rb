module SuperModel
  module Callbacks
    module Prepend
      def create(*args, &block)
        run_callbacks :create do
          create(*args, &block)
        end
      end

      def save(*args, &block)
        run_callbacks :save do
          save(*args, &block)
        end
      end

      def update(*args, &block)
        run_callbacks :update do
          update(*args, &block)
        end
      end

      def delete(*args, &block)
        run_callbacks :delete do
          delete(*args, &block)
        end
      end
    end
  end
end

module SuperModel
  module Callbacks
    extend ActiveSupport::Concern
    prepend SuperModel::Callbacks::Prepend

    included do
      instance_eval do
        extend ActiveModel::Callbacks
        define_model_callbacks :create, :save, :update, :destroy
      end
    end

  end
end
