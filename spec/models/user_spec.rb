require 'rails_helper'

describe User, type: :model do
  it "Should instantiate" do
    user = build(:user)
  end
end

FactoryBot.define do
  factory :user do
    first_name { "Jane" }
    last_name {"Doe" }
    admin { false }
    
  end
end