#Lets put the students into an array

students = []
students = [ 'Michael', 'Jack', 'Jeremy', 'Bruce', 'Nisar', 'James']

#now we print a list of the students
puts "The students of my cohort at Makers Academy"
puts "-------------------------------------------"
students.each do |student|
	puts student
end
#finally, we print the total
print "Overall, we have #{students.length} great students"
