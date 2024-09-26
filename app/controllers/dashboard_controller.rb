class DashboardController < ApplicationController
  def index
    render inertia: "Dashboard", props: {
      name: "Ghost Setup"
    }
  end
end
