class Photo < ApplicationRecord
  belongs_to :room
  has_attached_file :image,
  style:{ medium: "300x300",thumb:"100x100"},
  default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image,
  content_type: /\Aimage\/.*\z/
end
