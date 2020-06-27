class Topic < ApplicationRecord

  validates_presence_of :title

  has_many :blogs

  # topics que no tienen blogs, es decir,
  # su blogs es igual a nil
  def self.with_blogs
    includes(:blogs).where.not(blogs: {id: nil})
  end

end
