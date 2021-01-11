class HealthCheckController < ApplicationController
  def show
    render plain: 'Message from preview environment'
  end
end
