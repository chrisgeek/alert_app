require 'rails_helper'

RSpec.describe Alert, type: :model do
  # Validation tests
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:type) }
  it { is_expected.to validate_presence_of(:origin) }
  it { is_expected.to validate_presence_of(:tag) }
end
