class Portfolio < ApplicationRecord

	after_initialize :set_defaults

	def set_defaults
		self.main_image ||= "https://www3.nd.edu/~ljordan/linux/images/tuxsit.gif"
	end
end
