class Service < ActiveRecord::Base
  has_many :has_services
  has_many :projects, through: :has_services
end
