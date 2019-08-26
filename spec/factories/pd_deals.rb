# frozen_string_literal: true

FactoryBot.define do
  factory :pipeline_collection, class: PipelineDeals::Collection do
    skip_create
    pagination { { page: 1, pages: 1 } }
    elements { [] }
  end

  factory :pipeline_deal, class: PipelineDeals::Deal do
    skip_create

    sequence(:id)
    sequence(:name) do |n|
      "deal #{n}"
    end
    value { rand(1.0..1_000.0).round(2) }
    sequence(:deal_stage_id)
    deal_stage { OpenStruct.new(percent: 10, name: "Deal stage #{rand(1..5)}") }
  end
end
