# frozen_string_literal: true

class DealsController < ApplicationController
  def index
    render :index, locals: {
      data: ::DealsChartDatapointsQuery.all
    }
  end
end
