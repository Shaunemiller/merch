class Product < ActiveRecord::Base
	
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.svg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/



	validates :name, presence: true, uniqueness: true
	validates :description, presence: true, length: {minimum: 20}
	validates :price_in_pence, numericality: true
end
