module SuperModel
  module Observing
    module Prepend

      def create(*args, &block)
        notify_observers(:before_create)
        if result = super
          notify_observers(:after_create)
        end
        result
      end

      def save(*args, &block)
        notify_observers(:before_save)
        if result = super
          notify_observers(:after_save)
        end
        result
      end

      def update(*args, &block)
        notify_observers(:before_update)
        if result = super
          notify_observers(:after_update)
        end
        result
      end

      def delete(*args, &block)
        notify_observers(:before_delete)
        if result = super
          notify_observers(:after_delete)
        end
        result
      end

    end
  end
end

module SuperModel
  module Observing
    extend ActiveSupport::Concern
    include ActiveModel::Observing
    prepend SuperModel::Observing::Prepend
  end
end
