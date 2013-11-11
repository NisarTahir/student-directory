
#Lets put the students into an array

students = []
students = ['Michael', 'Jack', 'Jeremy', 'Bruce', 'Nisar', 'James']

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-------------------------------------------"
end

def print_students(names)
	#now we print a list of the students
	names.each do |name|
		puts name
	end
end

def print_footer(names)
	#finally, we print the total
	print "Overall, we have #{names.length} great students"
end


print_header
print_students(students)
print_footer(students)