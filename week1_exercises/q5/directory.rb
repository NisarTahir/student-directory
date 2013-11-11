
#Rewritten the each method in print_students to while instead

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-------------------------------------------"
end

def print_students(student)
	#now we print a list of the students
 x = student.length
  
 while x > 0
  	x = x - 1
    puts "#{student[x]}"#" is part of the #{student[:cohort]} cohort"
  end
end

def print_footer(names)
	#finally, we print the total
	puts "Overall, we have #{names.length} great students"
end

def get_students

  puts "Enter a student name and then press ENTER\nWhen you have finished, press ENTER twice"

  student_names = []

  name = gets.chomp

  while !name.empty? do
    student_names << {:name => name, :cohort => :november}
    name = gets.chomp 
  end

  return student_names
end

student_names = get_students

print_header
#p student_names.inspect
print_students(student_names)
print_footer(student_names)