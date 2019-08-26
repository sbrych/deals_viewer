# frozen_string_literal: true

class DealsChartDatapointsQuery
  def self.all
    Deal.select(
      <<~SQL
        deal_stage_percentage as percent,
        deal_stage_name as name,
        sum(value) as value
      SQL
    ).group(
      "deal_stage_percentage, deal_stage_name"
    ).order(
      "deal_stage_percentage"
    )
  end
end
