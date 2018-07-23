class DiplomController < ApplicationController
  before_action :permitted_params, only: [:show]

  def show
    diplom_res =  HTTParty.get("https://api.github.com/users/#{@permitted_params[:login]}")
    if diplom_res.success?
      @diplom = JSON.parse(diplom_res.body)
      render pdf: 'show', layout: false
    end
  end

  private

    def permitted_params
      @permitted_params = params.permit(:login).to_h
    end
end