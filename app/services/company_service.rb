module CompanyService
  class << self

    def index
      @companies = Company.all
      @companies.map { |company| filter_params(company) }
    end
    def show(params)
      @company = set_company(params, false)
      if @company
        @company
      else
        nil
      end
    end
    def create(params)
      @company = Company.new(company_params(params))
      if @company.save
        filter_params(@company)
      else
        nil
      end
    end

    def update(params)
      @company = set_company(params, false)

      if @company and @company.update(company_params(params))
        return @company
      else
        nil
      end
    end

    def destroy(params)
      @company = set_company(params, false)
      if @company and @company.destroy
        {}
      else
        nil
      end
    end

  
    def set_company(params, filtered)
      if Company.exists?(id: params[:id])
        @company = filtered ? filter_params(Company.find(params[:id])) : Company.find(params[:id])
      else
        @company = nil
      end
    end
    
    def filter_params(company)
      company.attributes.except("created_at", "updated_at")
    end

    def company_params(params)
      params.require(:company).permit(:mail, :phone, :address, :name, :description, :id)
    end
  end
end