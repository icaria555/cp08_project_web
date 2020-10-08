# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = [
  {:name => 'Rungroj Kulapan',
  :uid => 'icaria',
  :password => '123456',
  :user_class => 'Patient'
  },
  {:name => 'Angkachat Taeprasert',
  :uid => 'angkachat',
  :password => '123456',
  :user_class => 'Patient'
  },
  {:name => 'Kota Keta',
  :uid => 'kotaketa',
  :password => '123456',
  :user_class => 'Doctor'
  },
]
 
users.each do |user|
  User.create!(user)
end
