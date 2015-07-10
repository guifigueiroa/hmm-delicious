class Recipe < ActiveRecord::Base
  has_many :ingredients, dependent: :destroy
  has_many :prep_steps, dependent: :destroy
  has_many :hmms
  has_many :users, through: :hmms
  validates :name, presence: true, length: { maximum: 50 }
  validates :cooking_time, presence: :true
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "400x400" }
  validates_attachment :image, :presence => true,
    :content_type => { :content_type => "image/jpeg" }

end
