class VisitorsController < ApplicationController
  layout "landing_layout", :only => [:index]

  def index
    @navigation_page = :root
  end

end
