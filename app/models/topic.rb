class Topic < ActiveRecord::Base

  def slug
    title.downcase.gsub(/ /, '-')
  end

end