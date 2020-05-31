class Blog < ApplicationRecord
	enum status: { draft:0, published: 1 }
	extend FriendlyId
    friendly_id :title, use: :slugged

    validates_presence_of :title

    belongs_to :topic

    def self.huaei
      where(title:"Huaei")
    end

    scope :ruby_tricks_blog_items, -> { where(title: "ruby tricks") }

end
