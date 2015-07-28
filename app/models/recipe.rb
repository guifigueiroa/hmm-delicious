class Recipe < ActiveRecord::Base
  has_many :ingredients, dependent: :destroy
  has_many :prep_steps, dependent: :destroy
  has_many :hmms, dependent: :destroy
  has_many :users, -> { uniq }, through: :hmms
  has_many :reviews
  belongs_to :user
  validates :name, presence: true, length: { maximum: 50 }
  validates :cooking_time, presence: :true
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "400x400" }
  validates_attachment :image, presence: true,
    content_type: { content_type: "image/jpeg" }

  def hmm_by (user)
    @hmm = self.hmms.new
    @hmm.user = user
    return @hmm.save
  end

  def belongs_to? (user)
    self.user == user
  end

  def self.search (query)
    where("name like ?", "%#{query}%")
  end
end
