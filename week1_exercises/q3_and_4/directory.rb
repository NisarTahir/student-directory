
#Q3 and Q4 - Print names that start with the letter A and also print people who have less than 6 characters in their name

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
    if student[:name].capitalize[0,1] == "A"
		  puts "#{student[:name]} is part of the #{student[:cohort]} cohort and their name begins with the letter A"
    elsif student[:name].to_i < 6
      puts "#{student[:name]} is part of the #{student[:cohort]} cohort and their name length is less then 6"
    end
  end
end

def print_footer(names)
	#finally, we print the total
	puts "Overall, we have #{names.length} great student(s)"
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