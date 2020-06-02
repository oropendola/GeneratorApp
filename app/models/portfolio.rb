class Portfolio < ApplicationRecord

    has_many :technologies

    accepts_nested_attributes_for :technologies, 
                                 reject_if: lambda {|attrs| attrs['name'].blank?}

	after_initialize :set_defaults

	def set_defaults
		self.main_image ||= "https://www3.nd.edu/~ljordan/linux/images/tuxsit.gif"
	end
end
