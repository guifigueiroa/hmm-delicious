class PrepStep < ActiveRecord::Base
  belongs_to :recipe
  validates :description, presence: true
end
