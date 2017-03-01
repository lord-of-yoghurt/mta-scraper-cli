class SubwayLine

	attr_accessor :name, :status, :info_link

	@@all = []

	def initialize(name, status)
		@name = name
		@status = status
		self.class.all << self
	end

	def self.all
		@@all
	end

end