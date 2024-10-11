class ApplicationController < ActionController::Base
  def index
    render inertia: "Home", props: {}
  end
end
