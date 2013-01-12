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
StudyType::Translation.delete_all

Globalize.locale = :en
abstract_type = StudyType.create!(name: "Abstract")
lab_type = StudyType.create!(name: "Lab")
practical_type = StudyType.create!(name: "Practical work")
individual_type = StudyType.create!(name: "Individual task")
article_type = StudyType.create!(name: "Article")
control_type = StudyType.create!(name: "Control work")

Globalize.locale = :ru
abstract_type.update_attributes(name: "Реферат")
lab_type.update_attributes(name: "Лабораторная работа")
practical_type.update_attributes(name: "Практическая работа")
individual_type.update_attributes(name: "Индивидуальное задание")
article_type.update_attributes(name: "Статья")
control_type.update_attributes(name: "Контрольная работа")

Globalize.locale = :uk
abstract_type.update_attributes(name: "Реферат")
lab_type.update_attributes(name: "Лабораторна робота")
practical_type.update_attributes(name: "Практична робота")
individual_type.update_attributes(name: "Індивідуальне завдання")
article_type.update_attributes(name: "Стаття")
control_type.update_attributes(name: "Контрольна робота")

# Addind science degree types
ScienceDegree.delete_all
ScienceDegree::Translation.delete_all

Globalize.locale = :en
le = ScienceDegree.create!(name: "Lecturer")
sl = ScienceDegree.create!(name: "Senior lecturer")
cs = ScienceDegree.create!(name: "Candidate of Sciences")
ds = ScienceDegree.create!(name: "Doctor of Sciences")
rf = ScienceDegree.create!(name: "Research fellow")
dc = ScienceDegree.create!(name: "Docent")
pr = ScienceDegree.create!(name: "Professor")

Globalize.locale = :ru
le.update_attributes(name: "Преподаватель")
sl.update_attributes(name: "Старший преподаватель")
cs.update_attributes(name: "Кандидат наук")
ds.update_attributes(name: "Доктор наук")
rf.update_attributes(name: "Научный сотрудник")
dc.update_attributes(name: "Доцент")
pr.update_attributes(name: "Профессор")

Globalize.locale = :uk
le.update_attributes(name: "Викладач")
sl.update_attributes(name: "Старший викладач")
cs.update_attributes(name: "Кандидат наук")
ds.update_attributes(name: "Доктор наук")
rf.update_attributes(name: "Старший науковий співробітник")
dc.update_attributes(name: "Доцент")
pr.update_attributes(name: "Професор")

# Addidng subjects types
SubjectType.delete_all
SubjectType::Translation.delete_all

Globalize.locale = :en
pfe_type = SubjectType.create!(name: "Pass-fail exam")
exam_type = SubjectType.create!(name: "Exam")
pfg_type = SubjectType.create!(name: "Pass-fail grading")
coursework_type = SubjectType.create!(name: "Coursework")
term_paper_type = SubjectType.create!(name: "Term paper")

Globalize.locale = :ru
pfe_type.update_attributes(name: "Зачёт")
exam_type.update_attributes(name: "Экзамен")
pfg_type.update_attributes(name: "Дифференцированный зачёт")
coursework_type.update_attributes(name: "Курсовая работа")
term_paper_type.update_attributes(name: "Курсовой проект")

Globalize.locale = :uk
pfe_type.update_attributes(name: "Залік")
exam_type.update_attributes(name: "Іспит")
pfg_type.update_attributes(name: "Диференційований залік")
coursework_type.update_attributes(name: "Курсова робота")
term_paper_type.update_attributes(name: "Курсовий проект")

# Adding pair types
DoubleClassType.delete_all
DoubleClassType::Translation.delete_all

Globalize.locale = :en
lecture_type = DoubleClassType.create!(name: "Lecture")
laboratory_type = DoubleClassType.create!(name: "Laboratory research")
practical_type = DoubleClassType.create!(name: "Practical work")
consultation_type = DoubleClassType.create!(name: "Consultation")

Globalize.locale = :ru
lecture_type.update_attributes(name: "Лекция")
laboratory_type.update_attributes(name: "Лабораторная работа")
practical_type.update_attributes(name: "Практическая работа")
consultation_type.update_attributes(name: "Консультация")

Globalize.locale = :uk
lecture_type.update_attributes(name: "Лекція")
laboratory_type.update_attributes(name: "Лабораторна робота")
practical_type.update_attributes(name: "Практична робота")
consultation_type.update_attributes(name: "Консультація")

# Adding semester types
SemesterType.delete_all
SemesterType::Translation.delete_all

Globalize.locale = :en
semester_bachelor = SemesterType.create!(name: "Bachelor")
semester_master = SemesterType.create!(name: "Master")

Globalize.locale = :ru
semester_bachelor.update_attributes(name: "Бакалавр")
semester_master.update_attributes(name: "Магистр")

Globalize.locale = :uk
semester_bachelor.update_attributes(name: "Бакалавр")
semester_master.update_attributes(name: "Магістр")
