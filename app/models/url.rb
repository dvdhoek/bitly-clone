class Url < ActiveRecord::Base
	# validates :long_url, :format => URI::regexp(%w(http https))
	def self.shorten
		short_url = ([*('A'..'Z'),*('0'..'9')]-%w(0 1 I O)).sample(8).join
	end


end
