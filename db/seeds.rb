# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all

admin = User.create(email: 'admin@mail.com', password: 'adminpass')
admin.capabilities = ['manage_students_n_groups', 'manage_all_subjects', 'manage_articles']
admin.save