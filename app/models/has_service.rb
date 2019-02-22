class HasService < ActiveRecord::Base
  belongs_to :project
  belongs_to :service
end
