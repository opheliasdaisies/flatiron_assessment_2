#1. Arrays
array = ["Blake","Ashley","Jeff"]
array << "Sue"
array.each {|name| puts name}
array[1]
array.index("Jeff")

#2. Hashes
instructor = {:name=>"Ashley", :age=>27}
instructor[:location] = "NYC"
instructor.each{ |key, value| puts "#{key.to_s} is #{value}."}
instructor[:name]
instructor.key(27)