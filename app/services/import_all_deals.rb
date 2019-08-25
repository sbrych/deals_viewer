# frozen_string_literal: true

class ImportAllDeals
  include Service

  # On production, this service should be enqueueable to prevent timeouts when fetching.
  def call
    fetch_deals
  end

  private

  def fetch_deals
    page = 1
    loop do
      batch = PdWrapper.fetch_deals(page: page)
      import_deals(batch)
      page += 1
      break if page > batch.pagination[:pages]
    end
  end

  def import_deals(deals)
    deals_to_import = []

    deals.each do |fd|
      deals_to_import << Deal.new(
        external_id: fd.id,
        name: fd.name,
        value: fd.value,
        deal_stage_id: fd.deal_stage_id,
        deal_stage_percentage: fd.deal_stage.percent,
        deal_stage_name: fd.deal_stage.name
      )
    end

    Deal.import deals_to_import, on_duplicate_key_update: {
      conflict_target: :external_id,
      columns: [
        :name,
        :value,
        :deal_stage_id,
        :deal_stage_percentage
      ]
    }
  end
end
