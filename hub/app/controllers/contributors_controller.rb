class ContributorsController < ApplicationController
  before_action :permitted_params, only: [:show]

  def show
    # contrubutors_res =  HTTParty.get("http://#{request.host}:4000/repo=#{@permitted_params[:repo]}&owner=#{@permitted_params[:owner]}&count=#{@permitted_params[:count]}")

    contrubutors_res =  HTTParty.get("https://api.github.com/repos/#{@permitted_params[:owner]}/#{@permitted_params[:repo]}/contributors")
    if contrubutors_res.success?
      if @json = JSON.parse(contrubutors_res.body)
        render json: {contributors: @json.first(@permitted_params[:count].to_i) }
      else
        render json: {errors: "response not json"}
      end
    else
      render json: {errors: "can`t resolve repository"}
    end
  end

  protected

    def permitted_params
      @permitted_params = params.permit(:repo, :count, :owner).to_h
    end
end
