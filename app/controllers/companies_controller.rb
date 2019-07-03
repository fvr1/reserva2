class CompaniesController < ApplicationController
  def index
    @company = CompanyService.show(params)
    unless user_signed_in? or (user_signed_in? and current_user['company_id'] != @company.id)
      redirect_to company_reservations_path(id: params['id'])
    end
    @data_blocks = generate_blocks(@company)
  end

  def show
    @company = CompanyService.show(params)
    @data_blocks = generate_blocks(@company)
    @state = State.new
  end

  def edit
    @company = CompanyService.show(params)
    unless user_signed_in? or (user_signed_in? and current_user['company_id'] != @company.id)
      redirect_to company_reservations_path(id: params['id'])
    end
    @block = Block.new
    blocks = @company.blocks
    @all_days = (-20..20).map { |n| n.days.from_now }


    @data_blocks = []
    blocks.each do |block|
      @all_days.each do |day|
        next unless day.strftime('%A').downcase == block.day
        hb = HelperBlock.create_block(block, day, true)
        @data_blocks.push(hb)
      end
    end
  end

  def update
    @company = CompanyService.update(params)
    unless @company.nil?
      p @company
      redirect_to edit_company_path(id: @company.id)
    end
  end
end


def generate_blocks(company)
  @resource = company.resources.first

  if @resource.nil?
    @data_blocks = []
    @resource = company.resources.build
  end

  blocks = company.blocks
  reservations = @resource
                 .states
                 .where('date IS NOT NULL')
                 .where('date >= ?', Date.today)
                 .where('date < ?', 90.days.from_now)
  other_ocupation = @resource.states.where('date IS NULL')
  @all_days = (0..90).map { |n| n.days.from_now }

  @data_blocks = []
  blocks.each do |block|
    @all_days.each do |day|
      next unless day.strftime('%A').downcase == block.day

      available = true
      hb = HelperBlock.create_block(block, day, available)
      other_ocupation.each do |ocupation|
        if ocupation.block.id == block.id
          hb.available = false
          hb.ocupation = ocupation
        end
      end

      reservations.each do |reservation|
        next unless reservation.block.id == block.id

        same_day = reservation.date.day == day.day
        same_month = reservation.date.month == day.month
        same_year = reservation.date.year == day.year
        if same_day && same_month && same_year
          hb.available = false 
          hb.reservation = reservation.reservation 
        end
      end

      @data_blocks.push(hb)
    end
  end
  return @data_blocks
end