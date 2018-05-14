module SuperModel
  module Dirty
    module Prepend

      def create(*args, &block)
        result = super
        save_previous_changes
        result
      end

      def update(*args, &block)
        result = super
        save_previous_changes
        result
      end

    end
  end
end

module SuperModel
  module Dirty
    extend ActiveSupport::Concern
    include ActiveModel::Dirty
    prepend SuperModel::Dirty::Prepend

    def save_previous_changes
      @previously_changed = changes
      @changed_attributes.clear
    end
  end
end
