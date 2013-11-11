
#Lets put the students into an array

students = {}
students = [
  {:name => 'Michael', :cohort => :november},
  {:name => 'Jack',  :cohort => :november},
  {:name => 'Jeremy', :cohort => :november},
  {:name => 'Bruce', :cohort => :november},
  {:name => 'Nisar', :cohort => :november},
  {:name => 'James', :cohort => :november}
]

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-------------------------------------------"
end

def print_students(names)
	#now we print a list of the students
	names.each do |student|
		puts "#{student[:name]} is part of the #{student[:cohort]} cohort"
	end
end

def print_footer(names)
	#finally, we print the total
	puts "Overall, we have #{names.length} great students"
end

puts "Enter a student name and then press ENTER\nWhen you have finished type END and press ENTER"

student_names =[]

until student_names.last == "END"
  student_names << gets.chomp
end

print_header
student_names.pop
puts student_names
print_footer(student_names)


#print_header
#print_students(students)
#print_footer(students)