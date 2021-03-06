class Blog < ApplicationRecord
	enum status: { draft:0, published: 1 }
	extend FriendlyId
    friendly_id :title, use: :slugged

    validates_presence_of :title, :topic_id

    belongs_to :topic

    has_many :comments, dependent: :destroy

    def self.huaei
      where(title:"Huaei")
    end

    scope :ruby_tricks_blog_items, -> { where(title: "ruby tricks") }

    after_initialize :set_defaults

    def set_defaults
       self.topic_id ||= 1
    end

    def self.special_blogs
       limit(2)
    end

    def self.recent
        order("created_at DESC")
    end

end
