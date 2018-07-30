require 'spec_helper'

describe "Diploma" do
  subject { page }

  describe "Index page" do
    it 'sends a list of messages' do
      get("/diplom/show/tiazar")

      expect(response).to be_success
      expect(response.headers["Content-Type"]).to eq("application/pdf")
    end
  end
end
