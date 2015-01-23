class Product < ActiveRecord::Base
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/missing.svg"
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  	has_many :orders
    belongs_to :user
  	#This does this:
  	#def user
  	# 	User.find(self.user_id)
  	#end

	validates :name, presence: true, uniqueness: true
	validates :description, presence: true, length: {minimum: 25}
	validates :price_in_pence, numericality: true
end