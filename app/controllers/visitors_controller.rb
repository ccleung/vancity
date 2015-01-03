class VisitorsController < ApplicationController
  def index
    @goods = Category.find_by_id(1)
    @services = Category.find_by_id(2)
  end
end
