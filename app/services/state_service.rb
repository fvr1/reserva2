module StateService
  class << self

    def index
      @states = State.all
      @states.map { |state| filter_params(state) }
    end
    def show(params)
      @state = set_state(params, true)
      if @state
        filter_params(@state)
      else
        nil
      end
    end
    def create(params)
      @state = State.new(state_params(params))
      if @state.save
        filter_params(@state)
      else
        nil
      end
    end

    def update
      @state = set_resource(params, false)
      if @state and @state.update(resource_params(params))
        filter_params(@state)
      else
        nil
      end
    end

    def destroy
      @state = set_resource(params, false)
      if @state and @state.destroy
        {}
      else
        nil
      end
    end

  
    def set_state(params, filtered)
      if state.exists?(id: params[:id])
        @state = filtered ? filter_params(State.find(params[:id])) : State.find(params[:id])
      else
        @state = nil
      end
    end
    
    def filter_params(state)
      state.attributes.except("created_at", "updated_at")
    end

    def state_params(params)
      params.require(:state).permit(:category, :date, :resource_id, :block_id)
    end
  end
end