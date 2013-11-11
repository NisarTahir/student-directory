
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
	system("clear")
	names.each do |student|
		puts "#{student[:name]} is part of the #{student[:cohort]} cohort and from #{student[:country]}"
	end
end

def print_footer(names)
	#finally, we print the total
	puts "Overall, we have #{names.length} great students"
end

def get_students

  student_details = []

  system("clear")
	puts "Enter a student's name and then press ENTER\n"
  name = gets.chomp
  puts "Enter a student's country and then press ENTER\n"
  country = gets.chomp
  puts "When you have finished, press ENTER 2 times or once to continue"
  gets.chomp

  while !name.empty? || !country.empty? do
		system("clear")
		student_details << {:name => name, :country => country, :cohort => :november}
		puts "Enter a student's name and then press ENTER\n"
		name = gets.chomp
		if name.empty? 
			break
		end
		puts "Enter a student's country and then press ENTER\n"
	  country = gets.chomp
	  puts "When you have finished, press ENTER 2 times or once to continue"
	  gets.chomp
	end

	return student_details
end

student_names = get_students
print_header
print_students(student_names)
print_footer(student_names)