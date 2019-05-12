class ResourcesController < ApplicationController
  before_action :set_resource, only: %i[update destroy show]
  def index
    @resources = Resource.all
    render json: @resources, status: 200
  end

  def show
    if @resource
      render json: @resource, status: 200
    else
      render json: {}, status: 404
    end
  end

  def create
    @resource = Resource.new(resources_params)
    if @resource.save
      render json: @resource, status: 200
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  def update
    if @resource.update(resources_params)
      render json: @resource, status: 200
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  def destroy
    if @resource.destroy
      render json: {}, status: 200
    else
      render json: {}, status: 500
    end
  end

  private
  def set_resource
    if Resource.exists?(id: params[:id])
      @resource = Resource.find(params[:id])
    else
      @resource = nil
    end
  end

  def resources_params
    params.require(:resource).permit(:name, :details, :category, :company_id)
  end
end
