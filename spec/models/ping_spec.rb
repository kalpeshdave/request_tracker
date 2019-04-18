require 'rails_helper'

RSpec.describe Ping, type: :model do
  it { should validate_presence_of(:original_url) }
  it { should validate_presence_of(:type) }
  it { should validate_presence_of(:app_id) }
  it do
    should validate_inclusion_of(:type).
      in_array(['static', 'lite', 'dynamic'])
  end
  it { should validate_numericality_of(:app_id) }
end
