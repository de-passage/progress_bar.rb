module TinyProgressBar 
	def self.print current, max, options = {} 
		current = current.to_i
		max = max.to_i
		options = { 
			size: 100, 
			filled: '*', 
			empty: ' ', 
			precision: 0, 
			message: "Complete!", 
			opener: "[", 
			closer: "]" 
		}.merge options
		size = options[:size]
		filled = options[:filled]
		empty = options[:empty]
		opener = options[:opener]
		closer = options[:closer]
		precision = options[:precision]
		max_length = ("#{opener}" + (filled.length > empty.length ? filled : empty) * size + "#{closer} 100#{precision > 0 ? "." + "0" * precision : ""} (#{max}/#{max})").length
		ratio = current.to_f / max.to_f
		percentage = precision ? (ratio * 100.0).round(precision) : (ratio * 100.0)
		filled_size = (ratio * size).floor.to_i
		empty_size = size - filled_size

		$stdout.print "\b" * (max_length + 1)
		$stdout.print "#{opener}" + filled * filled_size + empty * empty_size + "#{closer} #{percentage}% (#{current}/#{max})"
		puts " #{options[:message]}" if current == max 
	end
end
