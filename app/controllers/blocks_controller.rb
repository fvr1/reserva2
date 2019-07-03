class BlocksController < ApplicationController
  def create
    params['block']['day'] = params['block']['day'].to_i
    @block = BlockService.create(params)
    redirect_to edit_company_path(id: @block.company.id)
  end
end
