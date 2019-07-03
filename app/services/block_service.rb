module BlockService
  class << self

    def index
      @blocks = Block.all
      @blocks.map { |block| block }
    end
    def show(params)
      @block = set_block(params, true)
      if @block
        @block
      else
        nil
      end
    end
    def create(params)
      @block = Block.new(block_params(params))
      p '=======laskdjf======='
      if @block.save
        p @block
        @block
      else
        nil
      end
    end

    def update
      @block = set_resource(params, false)
      if @block and @block.update(resource_params(params))
        @block
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
        @block = filtered ? Block.find(params[:id]) : Block.find(params[:id])
      else
        @block = nil
      end
    end
    
    

    def block_params(params)
      params.require(:block).permit(:start_time, :end_time, :day, :company_id)
    end
  end
end