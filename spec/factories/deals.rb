# frozen_string_literal: true

FactoryBot.define do
  factory :deal do
    sequence(:external_id)
    sequence(:name) { |n| "Deal #{n}" }
    value { rand(1.0..1_000.0).round(2) }
    sequence(:deal_stage_id)
    deal_stage_percentage { rand(0..100) }
    sequence(:deal_stage_name)  { |n| "Deal stage #{n}" }
  end
end
