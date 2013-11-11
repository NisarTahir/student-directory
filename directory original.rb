
#Lets put the students into an array

#students = {}
#students = [
  #{:name => 'Michael', :cohort => :november},
  #{:name => 'Jack',  :cohort => :november},
#  {:name => 'Jeremy', :cohort => :november},
#  {:name => 'Bruce', :cohort => :november},
 # {:name => 'Nisar', :cohort => :november},
  #{:name => 'James', :cohort => :november}
#]

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