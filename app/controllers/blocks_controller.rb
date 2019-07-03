class BlocksController < ApplicationController
  def create
    @block = BlockService.create(params)
    unless @block.nil?
      redirect_to edit_company_path(id: @block.company.id)
    end
  end
end
