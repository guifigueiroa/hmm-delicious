class PrepStep < ActiveRecord::Base
  belongs_to :recipe
  validates :ingredient, presence: true
end
