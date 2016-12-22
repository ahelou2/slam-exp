
dir = ARGV[0]
files = Dir.entries("#{dir}/rgb").select{|f| !File.directory? f}
sortedFiles = files.sort {|left, right| left[/\d+/].to_i <=> right[/\d+/].to_i}
formattedEntries = sortedFiles.map{|f| 
	timestamp = Time.now.to_f
	formattedStr = timestamp.to_s + " rgb/" + f + "\n"
	print formattedStr
	formattedStr
}

out_file = File.new("#{dir}/rgb.txt", "w")
File.open(out_file, 'w') { |file| 
	formattedEntries.each {|entry|
		file.write(entry) 
	}
}
out_file.close()