require 'rails_helper'

RSpec.describe Student do
  context 'enumeration\'s list' do
    it 'returns all enumeration codes' do
      expect(Status.list).to match_array([0,1])
    end
  end

  context 'enumerations' do
    context 'active' do
      it 'translates to 0 value' do
        expect(Status::ACTIVE).to eq(0)
      end
    end

    context 'inactive' do
      it 'translates to 1 value' do
        expect(Status::INACTIVE).to eq(1)
      end
    end
  end
end
