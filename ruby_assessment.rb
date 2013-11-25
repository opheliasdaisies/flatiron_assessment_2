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

#3. Nested Structures
school = { 
  :name => "Happy Funtime School",
  :location => "NYC",
  :instructors => [ 
    {:name=>"Blake", :subject=>"being awesome" },
    {:name=>"Ashley", :subject=>"being better than blake"},
    {:name=>"Jeff", :subject=>"karaoke"}
  ],
  :students => [ 
    {:name => "Marissa", :grade => "B"},
    {:name=>"Billy", :grade => "F"},
    {:name => "Frank", :grade => "A"},
    {:name => "Sophie", :grade => "C"}
  ]
}
school[:founded_in] = 2013
school[:students] << {:name => "Sally", :grade => "B"}
def remove_student(school,name)
	school[:students].each do |student|
		school[:students].delete(student) if student[:name] == (name)
	end
end
remove_student(school, "Billy")					#if part of a class, could call school.remove_student

school[:students].each { |student| student[:semester] = "Summer"}

def instructor_subject(school, name)
	school[:instructors].each do |instructor|
		instructor[:subject] = "being almost better than Blake" if instructor[:name] == name
	end
end
instructor_subject(school, "Ashley")

def change_grade(school, name, new_grade)
	school[:students].each do |student|
		student[:grade] = new_grade if student[:name] == name
	end
end
change_grade(school, "Frank", "F")

def with_grade(school, grade)
	students = []
	school[:students].each do |student|
		students << student[:name] if student[:grade] == grade
	end
	students
end
with_grade(school, "B")

def instructor_subject(school, name)
	subject = ""
	school[:instructors].each do |instructor|
		if instructor[:name] == name
			subject = instructor[:subject]
		end
	end
	subject
end
instructor_subject(school, "Jeff")

school.each do |key, value|
	if value.class == Array
		puts "The school's #{key.to_s} are:"
		value.each do |hash|
			hash.each do |key2, value2|
				print "    #{key2}: #{value2}.  "
			end
			puts 
		end
	else
		puts "The school's #{key.to_s} is #{value.to_s}."		
	end
end

#4. Methods
school = { 
  :name => "Happy Funtime School",
  :location => "NYC",
  :instructors => [ 
    {:name=>"Blake", :subject=>"being awesome" },
    {:name=>"Ashley", :subject=>"being better than blake"},
    {:name=>"Jeff", :subject=>"karaoke"}
  ],
  :students => [ 
    {:name => "Marissa", :grade => "B"},
    {:name=>"Billy", :grade => "F"},
    {:name => "Frank", :grade => "A"},
    {:name => "Sophie", :grade => "C"}
  ]
}

def get_grade(school,name)
	grade = ""
	school[:students].each do |student|
		if student[:name] == name
			grade = student[:grade]
		end
	end
	grade
end

school.each do |key, value|
	if value.class == Array
		puts "The school's #{key.to_s} are:"
		value.each do |hash|
			if key == :students
				puts "#{hash[:name]}: Grade #{get_grade(school, hash[:name])}" 
			else
				puts "#{hash[:name]} who teaches #{hash[:subject]}."
			end
		end
	else
		puts "The school's #{key.to_s} is #{value.to_s}."		
	end
end

def new_subject(school, instructor, new_subj)
	school[:instructors].each do |person|
		person[:subject] = new_subj if person[:name] == instructor
	end
end
new_subject(school, "Blake", "being terrible")

def new_student(school, student, grade)
	school[:students] << {:name => student, :grade => grade}
end
new_student(school, "Sara", "A")

def new_category(school, category, value)
	school[category] = value
end
new_category(school, :ranking, 1)







