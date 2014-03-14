module Subscribem
  class Account < ActiveRecord::Base
    validates :subdomain, presence: true, uniqueness: true
    validates_format_of :subdomain, with:    /\A[\w-]+\Z/i,
                                    message: 'is not allowed. Please choose another subdomain.'

    belongs_to :owner, class_name: 'Subscribem::User'
    accepts_nested_attributes_for :owner
  end
end
