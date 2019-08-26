# frozen_string_literal: true

require "rails_helper"

RSpec.describe DealsChartDatapointsQuery do
  describe ".all" do
    it "returns Deals with selected fields" do
      create_list(
        :deal,
        2,
        deal_stage_name: "first",
        deal_stage_percentage: 10,
        value: 10
      )
      create_list(
        :deal,
        3,
        deal_stage_name: "second",
        deal_stage_percentage: 30,
        value: 20,
      )
      create_list(
        :deal,
        1,
        deal_stage_name: "third",
        deal_stage_percentage: 20,
        value: 30
      )

      result = described_class.all

      expect(result).to match_array([
        an_object_having_attributes(name: "first", value: 20.0),
        an_object_having_attributes(name: "third", value: 30.0),
        an_object_having_attributes(name: "second", value: 60.0)
      ])
    end
  end
end
