require 'date'

class CompaniesController < ApplicationController
  def index
    @companies = CompanyService.index
    render json: @companies, status: 200
  end
  def show
    @company = CompanyService.show(params)
    # TODO: change resource
    @resource = @company.resources.first
    @blocks = @company.blocks
    reservations = @resource.states.where('date IS NOT NULL').where('date > ?', 0.days.from_now).where('date < ?', 90.days.from_now)
    other_ocupation = @resource.states.where('date IS NULL')

    @all_days = []
    (0..90).each do |n|
      @all_days.push(n.days.from_now)
    end

    @data_blocks = []
    @blocks.each do |block|
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

          @data_blocks.push(HelperBlock.new(DateTime.new(day.year, day.month, day.day, block.start_time.hour, block.start_time.min, 0),
          DateTime.new(day.year, day.month, day.day, block.end_time.hour, block.end_time.min, 0),
          available))

        end
      end
    end



  end
  def create
    @company = CompanyService.create(params)
    @company ? render_json(@company, 200) : render_json({}, :unprocessable_entity)
  end
  def update
    @company = CompanyService.update(params)
    @company ? render_json(@company, 200) : render_json({}, :unprocessable_entity)
  end
  def destroy
    @company = CompanyService.destroy(params)
    @company == {} ? render_json({}, 200) : render_json({}, 500)
  end
  private
  def render_json(company, status)
    render json: company, status: status
  end
end
