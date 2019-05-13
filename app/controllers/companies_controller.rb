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

    @all_days = []
    (0..90).each do |n|
      @all_days.push(n.days.from_now)
    end

    @data_blocks = []
    @blocks.each do |block|
      start_hour = block.start_time.strftime('%H')
      start_minute = block.start_time.strftime('%M')
      @all_days.each do |day|
        if (day.strftime('%A').downcase == block.day)

          @data_blocks.push(HelperBlock.new(DateTime.new(day.year, day.month, day.day, block.start_time.hour, block.start_time.min, 0),
          DateTime.new(day.year, day.month, day.day, block.end_time.hour, block.end_time.min, 0),
          false))
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
