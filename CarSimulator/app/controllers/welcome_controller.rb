class WelcomeController < ApplicationController
  def create_car
    if (!params.has_key?(:make) || params[:make].strip.empty?) && (!params.has_key?(:year) || params[:year].strip.empty?) && (!params.has_key?(:color) || params[:color].strip.empty?)
      render "create_car"
    else
      car = Car.new(params[:make], params[:year], params[:color], params[:desc])
      session[:car] = car.to_yaml
      redirect_to "/simulator/do"
    end
  end
end
