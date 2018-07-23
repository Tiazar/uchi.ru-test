class WelcomeController < ApplicationController
  before_action :permitted_params, only: [:contributors, :diplom]

  def index

  end

  def contributors
    # HTTParty.get("https://www.tinkoff.ru/api/v1/currency_rates/")
    puts 'test'
    contrubutors_res =  HTTParty.get("http://#{request.host}:4000/repo=#{@permitted_params[:repo]}&owner=#{@permitted_params[:owner]}&count=#{@permitted_params[:count]}")
  end

  protected

    def permitted_params
      @permitted_params = params.permit(:repo, :count, :owner).to_h
    end
end
