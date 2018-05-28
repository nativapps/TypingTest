# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email:'admin@email.com', password:'qwerty123', password_confirmation:'qwerty123')
Participant.create(first_name:'fuka', last_name:'xin', identification:'3456', phone:'34534', email:'fuka@email.com', password:'qwerty123', password_confirmation:'qwerty123')
Participant.create(first_name:'manuel', last_name:'xin', identification:'3456', phone:'34534', email:'manuel@email.com', password:'qwerty123', password_confirmation:'qwerty123')
Participant.create(first_name:'Melisa', last_name:'xin', identification:'3456', phone:'34534', email:'melisa@email.com', password:'qwerty123', password_confirmation:'qwerty123')
Participant.create(first_name:'Isabell', last_name:'xin', identification:'3456', phone:'34534', email:'isabell@email.com', password:'qwerty123', password_confirmation:'qwerty123')
Participant.create(first_name:'Marcus', last_name:'xin', identification:'3456', phone:'34534', email:'marcus@email.com', password:'qwerty123', password_confirmation:'qwerty123')
Room.create(name:'examen facil', start_date:'2018-04-27'.to_date, finish_date:'2018-06-28'.to_date, tried_times:5, set_limit:'60')
Room.create(name:'examen 2', start_date:'2018-04-27'.to_date, finish_date:'2018-06-28'.to_date, tried_times:5, set_limit:'60')
Room.create(name:'examen 3', start_date:'2018-04-27'.to_date, finish_date:'2018-06-28'.to_date, tried_times:5, set_limit:'60')
Room.create(name:'examen 4', start_date:'2018-04-27'.to_date, finish_date:'2018-06-28'.to_date, tried_times:5, set_limit:'60')
Room.create(name:'examen 5', start_date:'2018-04-27'.to_date, finish_date:'2018-06-28'.to_date, tried_times:5, set_limit:'60')
Room.create(name:'examen 6', start_date:'2018-04-27'.to_date, finish_date:'2018-06-28'.to_date, tried_times:5, set_limit:'60')
HasParticipant.create(room_id:1, participant_id:1)
HasParticipant.create(room_id:1, participant_id:2)
HasParticipant.create(room_id:1, participant_id:3)
HasParticipant.create(room_id:1, participant_id:4)
HasParticipant.create(room_id:1, participant_id:5)
HasParticipant.create(room_id:2, participant_id:1)
HasParticipant.create(room_id:2, participant_id:2)
HasParticipant.create(room_id:2, participant_id:3)
HasParticipant.create(room_id:2, participant_id:4)
HasParticipant.create(room_id:2, participant_id:5)
HasParticipant.create(room_id:3, participant_id:1)
HasParticipant.create(room_id:3, participant_id:2)
HasParticipant.create(room_id:3, participant_id:3)
HasParticipant.create(room_id:3, participant_id:4)
HasParticipant.create(room_id:3, participant_id:5)
HasParticipant.create(room_id:4, participant_id:1)
HasParticipant.create(room_id:4, participant_id:2)
HasParticipant.create(room_id:4, participant_id:3)
HasParticipant.create(room_id:4, participant_id:4)
HasParticipant.create(room_id:4, participant_id:5)
HasParticipant.create(room_id:5, participant_id:1)
HasParticipant.create(room_id:5, participant_id:2)
HasParticipant.create(room_id:5, participant_id:3)
HasParticipant.create(room_id:5, participant_id:4)
HasParticipant.create(room_id:5, participant_id:5)
TestBank.create(name:'English Test', type_test:'word test', text_test:'Hola este es un test bien cool que todos podemos realizar')
TestBank.create(name:'Spanish Test', type_test:'word test', text_test:'Hola este es un test bien cool que todos podemos realizar')
TestBank.create(name:'Number Test', type_test:'word test', text_test:'Hola este es un test bien cool que todos podemos realizar')
TestBank.create(name:'Bilingues Test', type_test:'word test', text_test:'Hola este es un test bien cool que todos podemos realizar')
TestBank.create(name:'Easy Test', type_test:'word test', text_test:'Hola este es un test bien cool que todos podemos realizar')
HasTest.create(room_id:1, test_bank_id:1)
HasTest.create(room_id:1, test_bank_id:2)
HasTest.create(room_id:1, test_bank_id:3)
HasTest.create(room_id:1, test_bank_id:4)
HasTest.create(room_id:1, test_bank_id:5)
HasTest.create(room_id:2, test_bank_id:1)
HasTest.create(room_id:2, test_bank_id:2)
HasTest.create(room_id:2, test_bank_id:3)
HasTest.create(room_id:2, test_bank_id:4)
HasTest.create(room_id:2, test_bank_id:5)
HasTest.create(room_id:3, test_bank_id:1)
HasTest.create(room_id:3, test_bank_id:2)
HasTest.create(room_id:3, test_bank_id:3)
HasTest.create(room_id:3, test_bank_id:4)
HasTest.create(room_id:3, test_bank_id:5)
HasTest.create(room_id:4, test_bank_id:1)
HasTest.create(room_id:4, test_bank_id:2)
HasTest.create(room_id:4, test_bank_id:3)
HasTest.create(room_id:4, test_bank_id:4)
HasTest.create(room_id:4, test_bank_id:5)
HasTest.create(room_id:5, test_bank_id:1)
HasTest.create(room_id:5, test_bank_id:2)
HasTest.create(room_id:5, test_bank_id:3)
HasTest.create(room_id:5, test_bank_id:4)
HasTest.create(room_id:5, test_bank_id:5)

Report.create(try_number: 3, correct: 56, incorrect: 12, total_type:123, total_word: 300, wpm: 30, accuracy: 98, participant_id: 1, room_id: 1, test_id: 1)
Report.create(try_number: 3, correct: 76, incorrect: 16, total_type:456, total_word: 300, wpm: 20, accuracy: 98, participant_id: 1, room_id: 1, test_id: 1)
Report.create(try_number: 3, correct: 54, incorrect: 10, total_type:234, total_word: 300, wpm: 32, accuracy: 89, participant_id: 1, room_id: 2, test_id: 1)
Report.create(try_number: 3, correct: 76, incorrect: 21, total_type:123, total_word: 300, wpm: 43, accuracy: 87, participant_id: 2, room_id: 2, test_id: 1)
Report.create(try_number: 4, correct: 56, incorrect: 22, total_type:123, total_word: 300, wpm: 54, accuracy: 88, participant_id: 2, room_id: 2, test_id: 2)
Report.create(try_number: 4, correct: 67, incorrect: 25, total_type:123, total_word: 300, wpm: 30, accuracy: 98, participant_id: 2, room_id: 2, test_id: 2)
Report.create(try_number: 4, correct: 76, incorrect: 30, total_type:124, total_word: 300, wpm: 50, accuracy: 87, participant_id: 2, room_id: 3, test_id: 2)
Report.create(try_number: 4, correct: 42, incorrect: 12, total_type:114, total_word: 300, wpm: 65, accuracy: 98, participant_id: 3, room_id: 3, test_id: 1)
Report.create(try_number: 3, correct: 98, incorrect: 11, total_type:116, total_word: 300, wpm: 21, accuracy: 95, participant_id: 3, room_id: 3, test_id: 1)
Report.create(try_number: 3, correct: 12, incorrect: 11, total_type:117, total_word: 300, wpm: 12, accuracy: 70, participant_id: 3, room_id: 3, test_id: 2)
Report.create(try_number: 3, correct: 14, incorrect: 12, total_type:125, total_word: 300, wpm: 32, accuracy: 78, participant_id: 4, room_id: 1, test_id: 1)
Report.create(try_number: 3, correct: 34, incorrect:  9, total_type:122, total_word: 300, wpm: 32, accuracy: 79, participant_id: 4, room_id: 1, test_id: 1)
Report.create(try_number: 3, correct: 89, incorrect:  3, total_type:121, total_word: 300, wpm: 34, accuracy: 79, participant_id: 4, room_id: 1, test_id: 1)
Report.create(try_number: 2, correct: 72, incorrect:  6, total_type:128, total_word: 140, wpm: 21, accuracy: 79, participant_id: 4, room_id: 2, test_id: 1)
Report.create(try_number: 2, correct: 34, incorrect:  4, total_type:120, total_word: 200, wpm: 10, accuracy: 80, participant_id: 5, room_id: 2, test_id: 3)
Report.create(try_number: 2, correct: 39, incorrect:  7, total_type:131, total_word: 230, wpm: 10, accuracy: 81, participant_id: 5, room_id: 1, test_id: 3)
Report.create(try_number: 2, correct: 50, incorrect:  1, total_type:122, total_word: 320, wpm: 20, accuracy: 90, participant_id: 5, room_id: 1, test_id: 3)
