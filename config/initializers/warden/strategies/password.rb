Warden::Strategies.add(:password) do
  # The request object in this instance is actually a Rack::Request object, rather than an
  # ActionDispatch::Request object. This is because the strategy is processed before the request gets
  # to the Rails stack. Therefore we need to use the ActionDispatch::Http::URL.extract_subdomains
  # method to get the subdomain for this request. We also need to use strings for the params keys for
  # the same reasons.

  def subdomain
    ActionDispatch::Http::URL.extract_subdomains(request.host, 1)
  end

  def valid?
    subdomain.present? && params['user']
  end

  def authenticate!
    return fail! unless account = Subscribem::Account.find_by(subdomain: subdomain)
    return fail! unless user    = account.users.find_by(email: params['user']['email'])
    return fail! unless user.authenticate(params['user']['password'])

    success! user
  end
end