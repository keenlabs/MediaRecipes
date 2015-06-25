class Page < ActiveRecord::Base
  has_and_belongs_to_many :content_items
  belongs_to :topic
end