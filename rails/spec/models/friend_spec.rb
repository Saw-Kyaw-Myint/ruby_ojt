require 'rails_helper'

RSpec.describe Friend, type: :model do
  context 'CRUD operation' do
    before do
      user=User.new(email:"myint@gmail.com",password:"saw777dd")
      user.save
      @friend =Friend.new(first_name:'saw kyaw',last_name:"myint",email:'saw@example.com',phone:'093939339',twitter:'afadfa',user_id:user.id)
      @friend.save
    end

    # Create
    it 'create a new friend' do
      expect(@friend).to be_valid
    end

    it 'show friend' do
      show_friend=Friend.find(@friend.id);
      expect(show_friend).to eq(@friend)
    end

    # update
    it 'update the friend' do
       @friend.update(first_name:"mya mya")
      #  binding.pry
       expect(@friend.reload.first_name).to eq('mya mya')
    end

    # delete
    it 'deletes the friend' do
      @friend.destroy
      expect(Friend.find_by(id: @friend.id)).to be_nil
    end
  end
end
