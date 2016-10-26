module ProgressBar 
	def self.print current, max, options = {} 
		current = current.to_i
		max = max.to_i
		options = { 
			size: 100, 
			fill: '*', 
			rest: ' ', 
			precision: 0, 
			message: "Complete!", 
			opener: "[", 
			closer: "]" 
		}.merge options
		size = options[:size]
		fill = options[:fill]
		rest = options[:rest]
		opener = options[:opener]
		closer = options[:closer]
		precision = options[:precision]
		max_length = ("#{opener}" + (fill.length > rest.length ? fill : rest) * size + "#{closer} 100#{precision > 0 ? "." + "0" * precision : ""} (#{max}/#{max})").length
		ratio = current.to_f / max.to_f
		percentage = precision ? (ratio * 100.0).round(precision) : (ratio * 100.0)
		fill_size = (ratio * size).floor.to_i
		rest_size = size - fill_size
		$stdout.print "\b" * max_length
		$stdout.print "#{opener}" + fill * fill_size + rest * rest_size + "#{closer} #{percentage}% (#{current}/#{max})"
		puts " #{options[:message]}" if current == max 
	end
end
