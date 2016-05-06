require 'rails_helper'

RSpec.describe Student, type: :model do
  let(:student) { build(:student) }

  subject { student }

  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:register_number) }
  it { is_expected.to respond_to(:status) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:register_number) }
  it { is_expected.to validate_presence_of(:status) }

  it { is_expected.to validate_length_of(:name).is_at_most(45) }
  it { is_expected.to validate_length_of(:register_number).is_at_most(45) }

  it { is_expected.to validate_numericality_of(:status) }
end
