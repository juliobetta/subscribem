module SubdomainHelpers
  # expects a block
  def within_account_subdomain
    let(:subdomain_url) { "http://#{account_subdomain}.example.com" }

    before { Capybara.default_host = subdomain_url            }
    after  { Capybara.default_host = 'http://www.example.com' }

    yield
  end
end