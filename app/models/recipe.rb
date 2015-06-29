class Recipe < ActiveRecord::Base
  has_many :ingredients, :dependent => :destroy
  has_many :prep_steps, :dependent => :destroy
  validates :name, presence: true
  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "400x400" }
  validates_attachment :image, :presence => true,
    :content_type => { :content_type => "image/jpeg" }

  def cooking_time_formatted
    if self.cooking_time.present?
      if self.cooking_time.strftime("%H").to_f > 0
        self.cooking_time.strftime "%H horas e %M minutos"
      else
        self.cooking_time.strftime "%M minutos"
      end
    end
  end
end
