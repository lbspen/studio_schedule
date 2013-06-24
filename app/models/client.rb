class Client < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :phone, :referral_source
  validates :email, :first_name, :last_name, :phone, :referral_source, :presence => true
  validates :email, :format => { :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/i, 
    :on => :create, :message => "invalid email format" }
  validates :phone, :format => { :with => /^(?:\+?1\s*(?:[.-]\s*)?)?(?:\(\s*([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9])\s*\)|([2-9]1[02-9]|[2-9][02-8]1|[2-9][02-8][02-9]))\s*(?:[.-]\s*)?([2-9]1[02-9]|[2-9][02-9]1|[2-9][02-9]{2})\s*(?:[.-]\s*)?([0-9]{4})$/,
    :on => :create, :message => "invalid phone number" }
end
