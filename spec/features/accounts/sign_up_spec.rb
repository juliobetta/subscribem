require "spec_helper"

feature "Accounts" do
  scenario "creating an account" do
    visit subscribem.root_path
    click_link "Account Sign Up"

    fill_in "Name",                  with: "Test"
    fill_in "Subdomain",             with: "test"
    fill_in "Email",                 with: "subscribem@example.com"
    fill_in "Password",              with: "password", :exact => true
    fill_in "Password confirmation", with: "password"

    click_button "Create Account"
    success_message = "Your account has been successfully created."

    page.should have_content(success_message)
    page.should have_content("Signed in as subscribem@example.com")
    page.current_url.should == "http://test.example.com/subscribem/"
  end
end