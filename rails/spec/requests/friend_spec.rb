require 'rails_helper'

RSpec.describe "Friends", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET /friends/new" do
    it 'renders the new friend page' do
      get new_friend_path
      expect(response).to be_successful
    end
  end

  describe "POST /friends" do
    context 'with valid parameters' do
      it 'creates a new friend' do
        friend_params = attributes_for(:friend)
        expect {
          post friends_path, params: { friend: friend_params }
        }.to change(Friend, :count).by(1)
        expect(response).to redirect_to(friend_path(Friend.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new friend' do
        friend_params = attributes_for(:friend, first_name: nil)
        expect {
          post friends_path, params: { friend: friend_params }
        }.not_to change(Friend, :count)
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET /friends/:id/edit" do
    it 'renders the edit friend page' do
      friend = create(:friend, user: user)
      get edit_friend_path(friend)
      expect(response).to be_successful
    end
  end

  describe "PATCH /friends/:id" do
    context 'with valid parameters' do
      it 'updates the friend' do
        friend = create(:friend, user: user)
        new_attributes = attributes_for(:friend, first_name: 'New Name')
        patch friend_path(friend), params: { friend: new_attributes }
        friend.reload
        expect(friend.first_name).to eq('New Name')
        expect(response).to redirect_to(friend_path(friend.id))
      end
    end

    context 'with invalid parameters' do
      it 'does not update the friend' do
        friend = create(:friend, user: user)
        invalid_attributes = attributes_for(:friend, first_name: nil)
        patch friend_path(friend), params: { friend: invalid_attributes }
        friend.reload
        expect(friend.first_name).not_to be_nil
        expect(response).to render_template(:edit)
      end
    end
  end
end
