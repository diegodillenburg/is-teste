require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:course) { build(:course) }

  subject { course }

  it { is_expected.to have_many(:classrooms) }
  it { is_expected.to have_many(:students).through(:classrooms) }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:description) }
  it { is_expected.to respond_to(:status) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:status) }

  it { is_expected.to validate_length_of(:name).is_at_most(45) }
  it { is_expected.to validate_length_of(:description).is_at_most(45) }

  it { is_expected.to validate_numericality_of(:status).is_less_than_or_equal_to(1) }

  context 'active students scope' do
    let(:active_course) { create(:course, status: 0) }
    let!(:inactive_course) { create(:course, status: 1) }

    it 'returns active courses only' do
      expect(Course.active).to match_array(active_course)
    end
  end
end
