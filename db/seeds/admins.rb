if Admin.count.zero?
	puts 'Seeding Admins'
	Admin.create!(email: 'moiseev_nvr@mail.ru', first_name: 'Ruslan', last_name: 'Moiseev', password: '123123', password_confirmation: '123123')
end
