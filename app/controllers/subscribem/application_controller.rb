module Subscribem
  class ApplicationController < ActionController::Base
    def current_account
      @current_account ||= begin
        account_id = env['warden'].user(scope: :account)
        Subscribem::Account.find(account_id)
      end
    end

    def current_user
      @current_user ||= begin
        if user_signed_in?
          user_id = env['warden'].user(scope: :user)
          Subscribem::User.find(user_id)
        end
      end
    end

    def user_signed_in?
      env['warden'].authenticated?(:user)
    end

    def authenticate_user!
      unless user_signed_in?
        flash[:notice] = 'Please sign in.'
        redirect_to '/sign_in'
      end
    end

    helper_method :current_account
    helper_method :current_user
    helper_method :user_signed_in?
  end
end
