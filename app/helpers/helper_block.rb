class HelperBlock
  attr_accessor :start_time, :end_time, :available, :block, :ocupation, :reservation
  def initialize(start_time, end_time, available, block)
    @start_time = start_time
    @end_time = end_time
    @available = available
    @block = block
    @ocupation = nil
    @reservation = nil
  end
end
