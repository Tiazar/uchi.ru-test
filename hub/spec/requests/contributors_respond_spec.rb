require 'spec_helper'

describe "Contributors" do
  subject { page }

  describe "Index page" do
    it 'sends a list of messages' do
      get("/contributors/show/rails/rails/3")
      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json['contributors'].length).to eq(3)
    end
  end
end
