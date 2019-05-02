# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resource, type: :model do
  describe 'Associations' do
    it { is_expected.to have_many(:state) }
    it { is_expected.to belong_to(:company)}
  end

  describe 'Attributes' do
    subject { } # { create(:resource) }
  end

end