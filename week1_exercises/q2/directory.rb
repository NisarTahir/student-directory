
#Add X = 0 and then x = x + 1 to print a number then the name

def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-------------------------------------------"
end

def print_students(names)
  x = 0
  #now we print a list of the students
	names.each_with_index do |student, index|
		#x = x + 1
    puts "#{index} #{student[:name]} is part of the #{student[:cohort]} cohort"
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
print_students(student_names)
print_footer(student_names)