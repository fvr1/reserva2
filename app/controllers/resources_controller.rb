# require_dependency "app/services/resource_service.rb"

class ResourcesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @resources = ResourceService.index
    render json: @resources, status: 200
  end

  def show
    @resource = ResourceService.show(params)
    @resource ? render_json(@resource, 200) : render_json({}, 404)
  end

  def create
    @resource = ResourceService.create(params)
    @resource ? render_json(@resource, 200) : render_json({}, :unprocessable_entity)
  end

  def update
    @resource = ResourceService.update(params)
    @resource ? render_json(@resource, 200) : render_json({}, :unprocessable_entity)
  end

  def destroy
    @resource = ResourceService.destroy(params)
    @resource == {} ? render_json({}, 200) : render_json({}, 500)
  end

  private
  def render_json(resource, status)
    render json: resource, status: status
  end
end
