class Post < ApplicationRecord

	validate_presence_of :title, :body
	
end
