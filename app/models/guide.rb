class Guide < ApplicationRecord

	validate_presence_of :title, :body
end
