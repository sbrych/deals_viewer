# frozen_string_literal: true

class PdWrapper
  def self.fetch_deals(page: 1)
    PipelineDeals::Deal.find(:all, params: { page: page })
  end
end
