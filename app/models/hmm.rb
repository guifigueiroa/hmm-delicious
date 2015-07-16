class Hmm < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe

  validates_uniqueness_of :user_id, scope: :recipe_id
  validates :user_id, presence: true
  validates :recipe_id, presence: true
  validate :cannot_hmm_own_recipe

  def cannot_hmm_own_recipe
    if self.recipe.present? and self.recipe.user == self.user
      self.recipe.errors.add(:base, I18n.t(:hmm_own_recipe_not_permitted))
      errors.add(:base, I18n.t(:hmm_own_recipe_not_permitted))
    end
  end
end
