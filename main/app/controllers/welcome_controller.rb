class WelcomeController < ApplicationController
  before_action :permitted_params, only: [:contributors, :diplom]

  def index

  end

  def contributors
    @errors = []
    contrubutors_res =  HTTParty.get("http://#{request.host}:4000/contributors/show/#{@permitted_params[:owner]}/#{@permitted_params[:repo]}/#{@permitted_params[:count]}")
    if contrubutors_res.success?
      json = JSON.parse(contrubutors_res.body)
      if json["contributors"]
        @contributors = json["contributors"]
      else
        @errors = json["errors"]
      end
    else
      @errors = {errors: "Can`t resolve service" }
    end
  rescue => e
    @errors << [e.class.name, e.message]
  end

  protected

    def permitted_params
      @permitted_params = params.permit(:repo, :count, :owner).to_h
    end
end
