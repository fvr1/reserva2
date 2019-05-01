# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Resource, type: :model do
  describe 'Associations' do
    # it { is_expected.to have_many(:xxx).through(:yyy)}
    # it { is_expected.to have_many(:xxx).dependent(:destroy)}
  end

  describe 'Attributes' do
    subject { } # { create(:resource) }
  end

end