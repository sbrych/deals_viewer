# frozen_string_literal: true

require "rails_helper"

RSpec.describe PdWrapper do
  context ".fetch_deals" do
    it "calls the PipelineDeals gem" do
      allow(PipelineDeals::Deal).to receive(:find)
      described_class.fetch_deals

      expect(PipelineDeals::Deal).to have_received(:find).with(:all, params: { page: 1 })
    end
  end
end
