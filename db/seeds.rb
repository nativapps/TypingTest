# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Room.create(name:'examen facil', start_date:'2018-04-27'.to_date, finish_date:'2018-04-28'.to_date, tried_times:5, set_limit:'0:30')
BankTest.create(name:'English Test', type_test:'word test', text_test:'Hola este es un test bien cool que todos podemos realizar')