require 'rails_helper'

RSpec.describe MemoriesController, :type => :controller do

  describe "GET show" do
    it "returns http success" do
      get :show
      expect(response).to be_success
    end
  end

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
  end

end
