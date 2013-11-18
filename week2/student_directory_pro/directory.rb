require 'date'

def print_menu
  puts "1. Enter student details"
  puts "2. Show the student details"
  puts "9. Exit the application"
end

def show_students
  print_header
  print_students(@students_details)
  print_footer(@students_details)
end

def process_menu(selection)
  case selection
    when "1"
      @students_details = get_students_details
    when "2"
      show_students
    when "9"
      exit
    else
      puts "Please enter a valid response"
  end
end

def interactive_menu
  loop do
    print_menu
    process_menu(gets.chomp)
  end
end


def print_header
	system("clear")
  puts "======================================================================"
  puts "|                 Student Directory list application                 |" 
  puts "======================================================================"
end

def print_students(names)
  cohorts =  names.sort_by {|student| student[:cohort]}

  cohorts.each do |student|
    puts "Student #{student[:name]} is part of the #{student[:cohort]} cohort and from #{student[:country]}"
  end
end 

def print_footer(names)
	#finally, we print the total
  if names.count == 0
	 puts "We have no students"
  elsif names.count == 1
    puts "Overall, we have #{names.length} great student\n\n"
  else
    puts "Overall, we have #{names.length} great students\n\n"
  end
end

def is_string(input)
  # \ regex |
  # \A \Z will search the entire line
  # \[A-Za-z] will search for letters only
  # + will look for all letters in the line
  result = /\A[A-Za-z]+\Z/.match(input)
  return result.to_s
end

def get_students_details

  student_details = []

  user_response = nil

  while user_response != "FIN"
    
    name = nil
    country = nil
    cohort = nil

    while is_string(name) == ""
      puts "Enter a student's name and then press ENTER\n"
      name = gets.chomp
    end

    while is_string(country) == "" 
      puts "Enter a student's country and then press ENTER\n"
      country = gets.chomp

      if country.empty?
        country = "UK"
      end 
    end

    while is_string(cohort) == ""
      puts "Enter student's cohort, i.e. month and then press ENTER\n"
      cohort = gets.chomp

      if cohort.empty?
        cohort = Date.today.strftime("%B") # <== This gives the current month name
      end
    end

    if !name.empty? || !country.empty?
      student_details << {:name => name, :country => country, :cohort => cohort.to_sym}
    end

    puts "When you have finished, [type FIN and press ENTER] or [just press ENTER to continue]"

	  user_response = gets.chomp

	  if user_response == "FIN"
	  	break
	  end

	end

	student_details
end

interactive_menu