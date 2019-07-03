module BlockService
  class << self

    def index
      @blocks = Block.all
      @blocks.map { |block| filter_params(block) }
    end
    def show(params)
      @block = set_block(params, true)
      if @block
        filter_params(@block)
      else
        nil
      end
    end
    def create(params)
      @block = Block.new(block_params(params))
      if @block.save
        filter_params(@block)
      else
        nil
      end
    end

    def update
      @block = set_resource(params, false)
      if @block and @block.update(resource_params(params))
        filter_params(@block)
      else
        nil
      end
    end

    def destroy
      @block = set_resource(params, false)
      if @block and @block.destroy
        {}
      else
        nil
      end
    end

  
    def set_block(params, filtered)
      if Block.exists?(id: params[:id])
        @block = filtered ? filter_params(Block.find(params[:id])) : Block.find(params[:id])
      else
        @block = nil
      end
    end
    
    def filter_params(block)
      block.attributes.except("created_at", "updated_at")
    end

    def block_params(params)
      params.require(:block).permit(:start_time, :end_time, :day, :company)
    end
  end
end