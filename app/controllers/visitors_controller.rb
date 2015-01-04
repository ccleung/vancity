class VisitorsController < ApplicationController
  def index
    #@goods = Category.find_by_id(1)
    @services = Category.find_by(name: 'services')
  end
end
