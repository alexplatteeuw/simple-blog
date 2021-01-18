class Element < ApplicationRecord
  belongs_to :post
  has_rich_text :content
  has_one_attached :image
  acts_as_list

  validates :element_type, inclusion: {in: ['paragraph', 'image', 'video-embed']}

  def paragraph?
    element_type == 'paragraph'
  end

  def image?
    element_type == 'image'
  end
end
