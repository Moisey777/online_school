if Course.count.zero?
	puts 'Seeding Courses'
	Course.create!(name: 'Ruby-developer', description: 'First course')
end