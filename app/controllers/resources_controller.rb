# require_dependency "app/services/resource_service.rb"

class ResourcesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @resources = ResourceService.index
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
    @resource = ResourceService.create(params)
    if @resource
      render json: @resource, status: 200
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  def update
    @resource = ResourceService.update(params)
    if @resource
      render json: @resource, status: 200
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  def destroy
    @resource = ResourceService.destroy(params)
    if @resource == {}
      render json: {}, status: 200
    else
      render json: {}, status: 500
    end
  end

  private
end
