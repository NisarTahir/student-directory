require 'date'

@students_details = []

def print_menu
  puts "1. Enter student details"
  puts "2. Show the student details"
  puts "3. Save students to students.csv"
  puts "4. Load students from students.csv"
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
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "Please enter a valid response"
  end
end

def interactive_menu
  loop do
    print_menu
    process_menu(STDIN.gets.chomp)
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

def is_valid_input(value)
  # \ regex |
  # \A \Z will search the entire line
  # \[A-Za-z] will search for letters only
  # + will look for all letters in the line
  result = /\A[A-Za-z]+\Z/.match(value)
  return result.to_s
end

def get_students_details

  user_response = nil

  while user_response != "FIN"

    name = get_valid_input("a student's name")
    country = get_valid_input("a student's country","UK")
    cohort = get_valid_input("student's cohort, i.e. month")

    if !name.empty? || !country.empty?
      @students_details << {:name => name, :country => country, :cohort => cohort.to_sym}
    end

    puts "When you have finished, [type FIN and press ENTER] or [just press ENTER to continue]"

	  user_response = STDIN.gets.chomp

	  if user_response == "FIN"
	  	break
	  end
	end
	@students_details
end

def get_valid_input(message, default="")
  value = nil
  while is_valid_input(value) == "" 
    puts "Enter #{message} and then press ENTER\n"
    value = STDIN.gets.chomp

    if value.empty? && message == "student's cohort, i.e. month"
      value = Date.today.strftime("%B") # <== This gives the current month name
    elsif value.empty? && message == "a student's country"
      value = "UK"
    end 
  end
  return value
end

def save_students
  file = File.open("students.csv", "w")
  @students_details.each do |student|
    student_data = [student[:name], student[:country], student[:cohort]]
    csv_line = student_data.join(",") #<-- This will create a line of text each word in that line will be separated by a comma
    file.puts csv_line
  end
  file.close
  puts "The data has been saved to students.csv"
end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    #puts "students_details: #{@students_details.class}"
    name, country, cohort = line.chomp.split(',') # Parallel assignment, i.e. [Nisar,UK,May] will be name will be Nisar - country will be UK and cohort will be May
    @students_details << {:name => name, :country => country, :cohort => cohort.to_sym}
  end
  file.close
end

def try_loading_students
  command_line_filename = ARGV.first

  return if command_line_filename.nil?
  if File.exists?(command_line_filename)
    load_students(command_line_filename)
  else 
    puts "File #{command_line_filename} does not exist"
  end
end

try_loading_students
show_students

interactive_menu