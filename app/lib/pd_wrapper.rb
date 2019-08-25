# frozen_string_literal: true

class PdWrapper
  def self.fetch_all_deals
    PipelineDeals::Deal.find(:all)
  end
end
