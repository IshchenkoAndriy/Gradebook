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
StudyType.create!(name: "Лабораторна робота")
StudyType.create!(name: "Практична робота")
StudyType.create!(name: "Індивідуальне завдання")
StudyType.create!(name: "Стаття")
StudyType.create!(name: "Контрольна робота")

# Addind science degree types
ScienceDegree.delete_all

ScienceDegree.create!(name: "Викладач")                     
ScienceDegree.create!(name: "Старший викладач")             
ScienceDegree.create!(name: "Кандидат наук")                
ScienceDegree.create!(name: "Доктор наук")                  
ScienceDegree.create!(name: "Старший науковий співробітник")
ScienceDegree.create!(name: "Доцент")                       
ScienceDegree.create!(name: "Професор")                     

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

# Adding semester types
SemesterType.delete_all

SemesterType.create!(name: "Бакалавр")
SemesterType.create!(name: "Магістр")   
