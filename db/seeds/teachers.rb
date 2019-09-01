if Teacher.count.zero?
	puts 'Seeding Teachers'
	Teacher.create!(first_name: 'Ruslan', last_name: 'Moiseev', description: 'Main Teacher')
	Teacher.create!(first_name: 'Daniil', last_name: 'Moiseev', description: 'Second Teacher')
	Teacher.create!(first_name: 'Roman', last_name: 'Dolgeeh', description: 'Third Teacher')
end