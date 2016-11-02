module TinyProgressBar 
	def self.print options = {} 
		return @options = nil if options == :reset or options[:reset]
		(@options ||= { 
			count: 0,
			size: 100, 
			filled: '*', 
			empty: ' ', 
			precision: 0, 
			message: "Complete!", 
			opener: "[", 
			closer: "]",
			last: nil,
			out: $stdout
		}).merge! options do |_, o, n| n.nil? ? o : n end
		@options[:before] = options[:before]
		@options[:after] = options[:after]
		count = (@options[:count] = @options[:count] ? @options[:count] + 1 : 1)
		size = @options[:size]
		filled = @options[:filled]
		empty = @options[:empty]
		opener = @options[:opener]
		closer = @options[:closer]
		precision = @options[:precision]
		max = @options[:max]
		ratio = count.to_f / max.to_f
		percentage = precision ? (ratio * 100.0).round(precision) : (ratio * 100.0)
		filled_size = (ratio * size).floor.to_i
		empty_size = size - filled_size
		@options[:out].print "\b" * (@options[:last] || 0) 
		str = "#{(@options[:before] || "")}#{opener}" + filled * filled_size + empty * empty_size + "#{closer} #{percentage}% (#{count}/#{max})#{(@options[:after] || "")}"
		@options[:out].print str
		@options[:last] = str.length
		if count == max 
			puts " #{@options[:message]}" 
			@options[:count] = 0
			@options[:last] = 0
		end
		@options
	end
end
