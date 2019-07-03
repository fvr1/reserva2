class CompaniesController < ApplicationController
  def index
    @company = CompanyService.show(params)
    # TODO: change resource
    @resource = @company.resources.first
    blocks = @company.blocks
    reservations = @resource.states.where('date IS NOT NULL').where('date >= ?', Date.today).where('date < ?', 90.days.from_now)
    other_ocupation = @resource.states.where('date IS NULL')
    @all_days = (0..90).map { |n| n.days.from_now }

    @data_blocks = []
    blocks.each do |block|
      @all_days.each do |day|
        if (day.strftime('%A').downcase == block.day)
          available = true
          hb = HelperBlock.new(
            DateTime.new(day.year, day.month, day.day, block.start_time.hour, block.start_time.min, 0),
            DateTime.new(day.year, day.month, day.day, block.end_time.hour, block.end_time.min, 0),
            available,
            block
          )

          other_ocupation.each do |ocupation|
            if (ocupation.block.id == block.id)
              hb.available = false
              hb.ocupation = ocupation
            end
          end

          reservations.each do |reservation|
            if (reservation.block.id == block.id)
              same_day = reservation.date.day == day.day
              same_month = reservation.date.month == day.month
              same_year = reservation.date.year == day.year
              if (same_day && same_month && same_year)
                hb.available = false
                hb.reservation = reservation.reservation
              end
            end
          end

          @data_blocks.push(hb)
        end
      end
    end
  end

  def show
    @company = CompanyService.show(params)
    # TODO: change resource
    @resource = @company.resources.first
    blocks = @company.blocks
    reservations = @resource.states.where('date IS NOT NULL').where('date >= ?', Date.today).where('date < ?', 90.days.from_now)
    other_ocupation = @resource.states.where('date IS NULL')
    @all_days = (0..90).map { |n| n.days.from_now }

    @data_blocks = []
    blocks.each do |block|
      @all_days.each do |day|
        if (day.strftime('%A').downcase == block.day)
          available = true
          other_ocupation.each do |ocupation|
            if (ocupation.block.id == block.id)
              available = false
            end
          end

          reservations.each do |reservation|
            if (reservation.block.id == block.id)
              same_day = reservation.date.day == day.day
              same_month = reservation.date.month == day.month
              same_year = reservation.date.year == day.year
              if (same_day && same_month && same_year)
                available = false
              end
            end
          end

          @data_blocks.push(
            HelperBlock.new(
              DateTime.new(day.year, day.month, day.day, block.start_time.hour, block.start_time.min, 0),
              DateTime.new(day.year, day.month, day.day, block.end_time.hour, block.end_time.min, 0),
              available,
              block
            )
          )
        end
      end
    end

    @state = State.new
  end

  def new
    @block = Block.new
  end
end
