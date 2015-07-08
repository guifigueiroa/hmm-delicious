class Hmm < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  validates_uniqueness_of :user_id, scope: :recipe_id
  validates :user_id, presence: true
  validates :recipe_id, presence: true
end
