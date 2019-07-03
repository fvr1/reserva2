class HelperBlock
  attr_accessor :start_time, :end_time, :available, :block

  def initialize(start_time, end_time, available, block)
    @start_time = start_time
    @end_time = end_time
    @available = available
    @block = block
  end

  class << self
    def create_block(block, day, available)
      start_time = get_date_time(day, block.start_time)
      end_time = get_date_time(day, block.end_time)
      new(start_time, end_time, available, block)
    end

    private

    def get_date_time(day, block_time)
      DateTime.new(
        day.year,
        day.month,
        day.day,
        block_time.hour,
        block_time.min,
        0
      )
    end
  end
end
