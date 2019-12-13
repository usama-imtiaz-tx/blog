class Article < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings

    validates :title, 
    presence: true, 
    length: { minimum: 5 }

    def all_tags=(names)
        self.tags = names.split(",").map do |name|
            Tag.where(name: name.strip).first_or_create!
        end
    end
    
    def all_tags
        self.tags.map(&:name)
    end

    def self.tagged_with(name)
        Tag.find_by_name!(name).posts
    end

end
