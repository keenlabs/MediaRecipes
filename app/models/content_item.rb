class ContentItem < ActiveRecord::Base
  has_and_belongs_to_many :pages
  belongs_to :author
  has_and_belongs_to_many :keywords

  def slug
    title.downcase.gsub(/ /, '-')
  end
end