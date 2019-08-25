# frozen_string_literal: true

require "rails_helper"

RSpec.describe PdWrapper do
  context ".fetch_all_deals" do
    it "calls the PipelineDeals gem" do
      allow(PipelineDeals::Deal).to receive(:find)
      described_class.fetch_all_deals

      expect(PipelineDeals::Deal).to have_received(:find).with(:all)
    end
  end
end
