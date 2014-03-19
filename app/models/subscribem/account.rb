module Subscribem
  class Account < ActiveRecord::Base
    validates :subdomain, presence: true, uniqueness: true
    validates_format_of :subdomain, with:    /\A[\w-]+\Z/i,
                                    message: 'is not allowed. Please choose another subdomain.'

    belongs_to :owner, class_name: 'Subscribem::User'
    has_many :members, class_name: 'Subscribem::Member'
    has_many :users, through: :members

    accepts_nested_attributes_for :owner

    def self.create_with_owner(params = {})
      account = new(params)
      if account.save
        account.users << account.owner
      end
      account
    end

  end
end