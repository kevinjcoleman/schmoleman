require 'rails_helper'

RSpec.describe Admin::MemoryImageController, :type => :controller do

  describe "GET destroy" do
    it "returns http success" do
      get :destroy
      expect(response).to be_success
    end
  end

end
