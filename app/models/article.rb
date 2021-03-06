class Article < ApplicationRecord
	has_many :comments, dependent: :destroy
	has_many :taggings
	has_many :tags, through: :taggings
	
	has_attached_file :image, styles: { medium: '150x300>', thumb: '100x100>'}
	validates_attachment_content_type :image, 
			:content_type => ['image/jpg', 'image/jpeg', 'image/png']
	validates :title, presence: true, length: {minimum: 5}
	
	def tag_list=(tags_string)
		tag_names = tags_string.split(',').collect{|t| t.strip.downcase}.uniq
		new_or_found_tags = tag_names.collect{|t| Tag.find_or_create_by(name: t)}
		self.tags = new_or_found_tags
	end
	def tag_list
	end
end
