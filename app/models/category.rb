class Category < ActiveRecord::Base
  has_and_belongs_to_many :content_pages
  has_many :blog_posts, :class_name => 'Blog::Post'
  validates_presence_of :name
  validates_uniqueness_of :name
  searchable_by :name

  class << self
    def find_or_create_by_name(name)
      cat = find_by_name name
      cat || Category.create(:name => name)
    end
  end
end

# == Schema Information
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

