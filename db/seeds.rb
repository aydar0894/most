# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

#Создание доктора
doc = User.create(
	email: 'doctor1@mail.ru',
	password: '123321',
	role: :doctor
	)

Doctor.create(
	first_name: 'Николай',
	last_name: 'Иванов',
	middle_name: 'Сергеевич',
	birth_date: '1985-04-12',
	user_id: doc.id
	)



org = User.create(
	email: 'organizer1@mail.ru',
	password: '123321',
	role: :organizer
	)

Organizer.create(
	company_name: 'КГМУ',
	user_id: org.id
	)


oper = User.create(
	email: 'operator1@mail.ru',
	password: '123321',
	role: :operator
	)

Operator.create(
	first_name: 'Андрей',
	last_name: 'Смирнов',
	middle_name: 'Михайлович',
	user_id: oper.id
	)


