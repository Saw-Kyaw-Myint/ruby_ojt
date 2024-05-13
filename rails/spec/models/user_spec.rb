require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
   it "ensoure email name presence" do
     user = User.new(email:'sample@example.com',password:"123333").save
     expect(user).to eq(true)
   end
  end
end
