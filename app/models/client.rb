class Client < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :phone, :referral_source
end
