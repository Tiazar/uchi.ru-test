require 'spec_helper'


describe "Welcome pages" do
  subject { page }

  feature "Index page" do
    let(:contributors) {
      {"contributors":[
          {
              "login": "rafaelfranca",
              "id": 47848,
              "node_id": "MDQ6VXNlcjQ3ODQ4",
              "avatar_url": "https://avatars3.githubusercontent.com/u/47848?v=4",
              "gravatar_id": "",
              "url": "https://api.github.com/users/rafaelfranca",
              "html_url": "https://github.com/rafaelfranca",
              "followers_url": "https://api.github.com/users/rafaelfranca/followers",
              "following_url": "https://api.github.com/users/rafaelfranca/following{/other_user}",
              "gists_url": "https://api.github.com/users/rafaelfranca/gists{/gist_id}",
              "starred_url": "https://api.github.com/users/rafaelfranca/starred{/owner}{/repo}",
              "subscriptions_url": "https://api.github.com/users/rafaelfranca/subscriptions",
              "organizations_url": "https://api.github.com/users/rafaelfranca/orgs",
              "repos_url": "https://api.github.com/users/rafaelfranca/repos",
              "events_url": "https://api.github.com/users/rafaelfranca/events{/privacy}",
              "received_events_url": "https://api.github.com/users/rafaelfranca/received_events",
              "type": "User",
              "site_admin": false,
              "contributions": 5704
          },
          {
              "login": "tenderlove",
              "id": 3124,
              "node_id": "MDQ6VXNlcjMxMjQ=",
              "avatar_url": "https://avatars1.githubusercontent.com/u/3124?v=4",
              "gravatar_id": "",
              "url": "https://api.github.com/users/tenderlove",
              "html_url": "https://github.com/tenderlove",
              "followers_url": "https://api.github.com/users/tenderlove/followers",
              "following_url": "https://api.github.com/users/tenderlove/following{/other_user}",
              "gists_url": "https://api.github.com/users/tenderlove/gists{/gist_id}",
              "starred_url": "https://api.github.com/users/tenderlove/starred{/owner}{/repo}",
              "subscriptions_url": "https://api.github.com/users/tenderlove/subscriptions",
              "organizations_url": "https://api.github.com/users/tenderlove/orgs",
              "repos_url": "https://api.github.com/users/tenderlove/repos",
              "events_url": "https://api.github.com/users/tenderlove/events{/privacy}",
              "received_events_url": "https://api.github.com/users/tenderlove/received_events",
              "type": "User",
              "site_admin": true,
              "contributions": 4894
          }]
      }
    }

    before { visit root_path }
    it "should working" do
      fill_in_and_click(contributors)
      expect(page).to have_selector('li', count: 2)
    end

    it "should not working" do
      fill_in_and_click({"errors"=>"custom error"})
      expect(page).to have_content("custom error")
    end

  end
end

def fill_in_and_click(data)
  fill_in "repo", with: 'rails'
  fill_in "owner", with: 'rails'
  fill_in "count", with: '2'

  stub_request(:get, /www.example.com:4000/).
      with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: data.to_json, headers: {})
  find('input[name="commit"]').click
end