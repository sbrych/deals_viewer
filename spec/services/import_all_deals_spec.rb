# frozen_string_literal: true

require "rails_helper"

RSpec.describe ImportAllDeals do
  describe ".call" do
    context "zero deals" do
      let(:deals) do
        create(
          :pipeline_collection,
          elements: []
        )
      end

      it "does not import any deals" do
        allow(PdWrapper).to receive(:fetch_deals) { deals }

        expect { described_class.call }.not_to change(Deal, :count)
      end
    end

    context "single page of deals" do
      let(:deal_list) do
        create_list(:pipeline_deal, 5)
      end

      let(:deals) do
        create(
          :pipeline_collection,
          elements: deal_list
        )
      end

      it "imports all of the deals" do
        allow(PdWrapper).to receive(:fetch_deals) { deals }

        expect { described_class.call }.to change(Deal, :count).by(5)
      end
    end

    context "multiple pages of deals" do
      let(:deal_list) do
        create_list(:pipeline_deal, 5)
      end

      let(:deal_list_2) do
        create_list(:pipeline_deal, 5)
      end

      let(:deals_page_1) do
        create(
          :pipeline_collection,
          pagination: { page: 1, pages: 2 },
          elements: deal_list
        )
      end

      let(:deals_page_2) do
        deals_page_1.pagination[:page] = 2
        deals_page_1.elements = deal_list_2

        deals_page_1
      end

      it "imports all of the deals" do
        allow(PdWrapper).to receive(:fetch_deals).with(page: 1) { deals_page_1 }
        allow(PdWrapper).to receive(:fetch_deals).with(page: 2) { deals_page_2 }

        expect { described_class.call }.to change(Deal, :count).by(10)
      end
    end

    context "updating deals" do
      let(:updated_deal) do
        create(
          :pipeline_deal,
          id: 1,
          name: "John Rambo Bow and Arrows"
        )
      end

      let(:deals) do
        create(
          :pipeline_collection,
          elements: [updated_deal]
        )
      end

      it "updates the records" do
        existing_deal = create(:deal, external_id: 1)
        allow(PdWrapper).to receive(:fetch_deals) { deals }

        expect { described_class.call }.not_to change(Deal, :count)
        expect(existing_deal.reload.name).to eq "John Rambo Bow and Arrows"
      end
    end
  end
end
