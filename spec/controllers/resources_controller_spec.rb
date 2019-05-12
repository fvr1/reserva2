require 'rails_helper'

RSpec.describe ResourcesController, type: :controller do
  describe "Methods" do
    describe "GET resources#index" do
      context "when there is no user" do
        pending "no user"
      end
      context "when there user" do
        pending "user"
      end
    end
    describe "POST resources#create" do
      pending "new resource"
    end
    describe "PATCH resources#update" do
      pending "update resource"
    end
    describe "DESTROY resources#destroy" do
      pending "delete resource"
    end
  end
  describe "Private params POST/UPDATE :name :details :category :company_id" do
    describe "wrong params: missing some" do
    end

    describe "correct params: all given" do
    end
  end

end
