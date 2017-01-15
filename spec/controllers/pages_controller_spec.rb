require 'rails_helper'

describe PagesController do

  before :each do
    @user = FactoryGirl.create(:user, :mentor)
  end

  describe 'not signed in' do
    it 'should be a success' do
      [:home, :about].each do |action|
        get action
        expect(response.status).to eq 200
      end
    end
  end
  describe 'signed in' do
    it 'should be a success' do
      [:home, :about].each do |action|
        get action
        expect(response.status).to eq 200
      end
    end
  end
  describe 'GET #home' do
    before do
      get :home
    end
    it 'should assign a mentor plan as mentor_plan' do
      expect(assigns(:mentor_plan)).to eq @mentor_plan
    end
    it 'should assign a mentee plan as mentee_plan' do
      expect(assigns(:mentee_plan)).to eq @mentee_plan
    end
  end
end