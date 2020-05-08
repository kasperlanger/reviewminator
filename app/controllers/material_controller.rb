class MaterialController < ApplicationController
  def create
    render json: Material.create!(safe_params)
  end

  def index
    render json: Material.all
  end

  def show
    render json: Material.find(params['id'])
  end

  def learning
    render json: Material.learning
  end

  def learn
    redirect_to Material.find(params['material_id']).url
  end

  def safe_params
    params.permit([:url])
  end
end
