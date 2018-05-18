class Restaurant < ApplicationRecord
  validates_presence_of :name
  mount_uploader :image, PhotoUploader
  belongs_to :category, optional: true
  has_many :comments

  def prev
    Restaurant.where("id<?", id).last    
  end

  def next
    Restaurant.where("id>?", id).first
  end


end
