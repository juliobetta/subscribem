Warden::Strategies.add(:password) do
  # The request object in this instance is actually a Rack::Request object, rather than an
  # ActionDispatch::Request object. This is because the strategy is processed before the request gets
  # to the Rails stack. Therefore we need to use the ActionDispatch::Http::URL.extract_subdomains
  # method to get the subdomain for this request. We also need to use strings for the params keys for
  # the same reasons.
  def valid?
    host      = request.host
    subdomain = ActionDispatch::Http::URL.extract_subdomains(host, 1)
    subdomain.present? && params['user']
  end

  def authenticate!
    if user = Subscribem::User.find_by(email: params['user']['email'])
      user.authenticate(params['user']['password']) ? success!(user) : fail!
    else
      fail!
    end
  end
end