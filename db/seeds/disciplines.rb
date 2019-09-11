if Discipline.count.zero?
	puts 'Seeding Desciplines'

	%W(Программирование Ruby).each do |name|
	  Discipline.create!(name: name)
	end
end