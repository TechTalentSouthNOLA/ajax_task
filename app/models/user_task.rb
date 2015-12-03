class UserTask < ActiveRecord::Base
  validates :description, presence: true
end
