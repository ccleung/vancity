class VisitorsController < ApplicationController
	def home
	end

  def index
    @goods = Category.find_by_id(1)
    @services = Category.find_by_id(2)
  end
end
