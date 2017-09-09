class Room < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :reservations
  geocoded_by :address
  after_validation :geocode,if: :address_changed?
  def cover_photo(size) 
      if self.photos.length > 0 # check if photo exists 					  
        self.photos[0].image.url(size) 
        else
          "blank.png" 
      end
    end
  
  validates :home_type,presence: true
  validates :room_type,presence: true
  validates :accommodate, presence: true
  validates :bed_room ,presence: true
  validates :bath_room ,presence: true
end
