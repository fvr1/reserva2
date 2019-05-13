class CompaniesController < ApplicationController
  def index
    @companies = CompanyService.index
    render json: @companies, status: 200
  end
  def show
    @company = CompanyService.show(params)
    @company ? render_json(@company, 200) : render_json({}, 404)
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
