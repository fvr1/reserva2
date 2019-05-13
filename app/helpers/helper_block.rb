class HelperBlock
  attr_accessor :start_time, :end_time, :available
  def initialize(start_time, end_time, available)
    @start_time = start_time
    @end_time = end_time
    @available = available
  end
end