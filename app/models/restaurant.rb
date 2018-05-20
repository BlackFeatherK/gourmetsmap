class Restaurant < ApplicationRecord
  validates_presence_of :name
  mount_uploader :image, PhotoUploader
  belongs_to :category, optional: true
  # 當 Restaurant 物件被刪除時，順便刪除依賴的 Comment
  has_many :comments, dependent: :destroy

  def prev
    Restaurant.where("id<?", id).last    
  end

  def next
    Restaurant.where("id>?", id).first
  end


end
