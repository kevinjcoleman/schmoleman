class Memory < ActiveRecord::Base
	before_create :set_priority
	geocoded_by :location   # can also be an IP address
	after_validation :geocode          # auto-fetch coordinates
	has_many :memory_images

	scope :prioritized, -> { order(priority: :asc) }
	def geojsonify
		geojson = {
		    type: 'Feature',
		    geometry: {
		      type: 'Point',
		      coordinates: [self.longitude, self.latitude]
		    },
		    properties: {
		      name: self.name,
		      :'marker-color' => '#38ABD1',
		      :'marker-symbol' => 'star-stroked',
		      :'marker-size' => 'large'
		    }
		  }
		return geojson
	end

	def next
		return Memory.find_by(priority: (self.priority + 1))
	end

	def previous
		return Memory.find_by(priority: (self.priority - 1))
	end

	private 

		def set_priority
			self.priority = Memory.prioritized.count + 1
		end
end
