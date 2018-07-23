class WelcomeController < ApplicationController
  before_action :permitted_params, only: [:contributors, :diplom]

  def index

  end

  def contributors
    @errors = []
    contrubutors_res = HTTParty.get("http://#{request.host}:4000/contributors/show/#{@permitted_params[:owner]}/#{@permitted_params[:repo]}/#{@permitted_params[:count]}")
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

  def diplom
    diplom_res = HTTParty.get("http://#{request.host}:5000/diplom/show/#{@permitted_params[:login]}")
    send_data diplom_res,
              filename: "#{@permitted_params[:login]}.pdf",
              type: 'application/pdf',
              disposition: 'inline'
  rescue => e
    @errors = [[e.class.name, e.message]]
    render 'welcome/contributors'
  end

  private

    def permitted_params
      @permitted_params = params.permit(:repo, :count, :owner, :login).to_h
    end
end
