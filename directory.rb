
#Lets put the students into an array

students = []
students = [
  ['Michael', :november],
  ['Jack',  :november],
  ['Jeremy', :november],
  ['Bruce', :november],
  ['Nisar', :november],
  ['James', :november]
]

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-------------------------------------------"
end

def print_students(names)
	#now we print a list of the students
	names.each do |name, cohort|
		puts "#{name} is part of the #{cohort} cohort"
	end
end

def print_footer(names)
	#finally, we print the total
	print "Overall, we have #{names.length} great students"
end


print_header
print_students(students)
print_footer(students)