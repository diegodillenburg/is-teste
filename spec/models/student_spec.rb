require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:student) { build(:student) }

  subject { student }

  it { is_expected.to have_many(:classrooms) }
  it { is_expected.to have_many(:courses).through(:classrooms) }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:register_number) }
  it { is_expected.to respond_to(:status) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:register_number) }
  it { is_expected.to validate_presence_of(:status) }

  it { is_expected.to validate_length_of(:name).is_at_most(45) }
  it { is_expected.to validate_length_of(:register_number).is_at_most(45) }

  it { is_expected.to validate_numericality_of(:status).is_less_than_or_equal_to(1) }

  context 'active students scope' do
    let(:active_student) { create(:student, status: 0) }
    let!(:inactive_student) { create(:student, status: 1) }

    it 'returns active students only' do
      expect(Student.active).to match_array(active_student)
    end
  end
end
