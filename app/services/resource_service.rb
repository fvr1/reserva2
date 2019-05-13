module ResourceService
  class << self

    def index
      @resources = Resource.all
      @resources.map { |resource| filter_params(resource)}
    end

    def show(params)
      @resource = set_resource(params, true)
      if @resource
        @resource
      else
        nil
      end
    end


    def create(params)
      @resource = Resource.new(resources_params(params))
      if @resource.save
        filter_params(@resource)
      else
        nil
      end
    end

    def update(params)
      @resource = set_resource(params, false)
      if @resource and @resource.update(resources_params(params))
        filter_params(@resource)
      else
        nil
      end
    end

    def destroy(params)
      @resource = set_resource(params, false)
      if @resource and @resource.destroy
        {}
      else
        nil
      end
    end

    def set_resource(params, filtered)
      if Resource.exists?(id: params[:id])
        @resource = filtered ? filter_params(Resource.find(params[:id])) : Resource.find(params[:id])
      else
        @resource = nil
      end
    end

    def filter_params(resource)
      resource.attributes.except("created_at", "updated_at")
    end

    def resources_params(params)
      params.require(:resource).permit(:name, :details, :category, :company_id)
    end

  end
end