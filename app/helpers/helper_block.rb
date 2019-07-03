class HelperBlock
  attr_accessor :start_time, :end_time, :available, :block
  def initialize(start_time, end_time, available, block)
    @start_time = start_time
    @end_time = end_time
    @available = available
    @block = block
  end
end
