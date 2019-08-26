# frozen_string_literal: true

module Service
  extend ActiveSupport::Concern

  class_methods do
    def call(*args)
      service = new(*args)
      if service.runnable?
        if block_given?
          service.call do
            yield
          end
        else
          service.call
        end
      end
    end
  end

  def runnable?
    true
  end
end
