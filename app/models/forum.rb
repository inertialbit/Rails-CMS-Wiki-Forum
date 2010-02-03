# == Schema Information
# Schema version: 20100125191432
#
# Table name: forums
#
#  id                     :integer       not null, primary key
#  title                  :string(255)   
#  description            :text          
#  position               :integer       
#  moderator_only         :boolean       
#  newest_message_post_id :integer       
#  created_at             :datetime      
#  updated_at             :datetime      
# End Schema

class Forum < ActiveRecord::Base
  alias_attribute :name, :title
  
  validates_presence_of :title

  belongs_to :most_recent_post, :class_name => 'MessagePost', :foreign_key => :newest_message_post_id
  has_many :message_posts, :dependent => :destroy

  class << self
    def all_forums
      find :all, :order => 'title'
    end
  end
end
