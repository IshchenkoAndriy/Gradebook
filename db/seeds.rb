#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Adding a admin user
User.delete_all

admin = User.create!(email: 'admin@mail.com', password: 'adminpass')
admin.capabilities = ['manage_users', 'manage_students_n_groups', 'manage_all_subjects', 'manage_articles']
admin.save

# Adding study types
StudyType.delete_all

StudyType.create!(name: "Реферат")
StudyType.create!(name: "Індивідуальне завдання")
StudyType.create!(name: "Стаття")
StudyType.create!(name: "Контрольна робота")                  

# Addidng subjects types
SubjectType.delete_all

SubjectType.create!(name: "Залік")                   
SubjectType.create!(name: "Іспит")                  
SubjectType.create!(name: "Диференційований залік")  
SubjectType.create!(name: "Курсова робота")   
SubjectType.create!(name: "Курсовий проект")  

# Adding pair types
DoubleClassType.delete_all

DoubleClassType.create!(name: "Лекція")               
DoubleClassType.create!(name: "Лабораторна робота")
DoubleClassType.create!(name: "Практична робота")   
DoubleClassType.create!(name: "Консультація")

