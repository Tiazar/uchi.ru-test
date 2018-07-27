require 'spec_helper'

describe "Welcome pages" do
  subject { page }

  describe "Index page" do
    before { visit root_path }
    it { should have_content('repo') }
    it { should have_content("owner") }
    it { should have_content('count') }
  end
end
