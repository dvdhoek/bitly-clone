class Url < ActiveRecord::Base
	validates :long_url, :format => URI::regexp(%w(http https))
	before_create :shorten
	def shorten
		self.short_url = ([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O)).sample(8).join
	end


end
