class HealthCheckController < ApplicationController
  def show
    render plain: '200 OK'
  end
end
