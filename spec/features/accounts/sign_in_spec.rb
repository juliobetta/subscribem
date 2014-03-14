require 'spec_helper'

feature 'User sign in' do
  extend SubdomainHelpers
  # let! force the method's invocation before each example
  let!(:account)    { FactoryGirl.create(:account)                      }
  let(:sign_in_url) { "http://#{account.subdomain}.example.com/sign_in" }
  let(:root_url)    { "http://#{account.subdomain}.example.com/"        }

  within_account_subdomain do
    scenario 'signin in as an account owner successfully' do
      visit root_url
      page.current_url.should == sign_in_url

      fill_in 'Email', with: account.owner.email
      fill_in 'Password', with: 'password'
      click_button 'Sign in'

      page.should have_content('You are now signed in.')
      page.current_url.should == root_url
    end
  end
end