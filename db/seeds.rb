# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email:'admin@email.com', password:'qwerty123', password_confirmation:'qwerty123')
Participant.create(first_name:'fuka', last_name:'xin', identification:'3456', phone:'34534', email:'fuka@email.com', password:'qwerty123', password_confirmation:'qwerty123')
Room.create(name:'examen facil', start_date:'2018-04-27'.to_date, finish_date:'2018-06-28'.to_date, tried_times:5, set_limit:'60')
TestBank.create(name:'English Test', type_test:'word test', text_test:'Hola este es un test bien cool que todos podemos realizar')