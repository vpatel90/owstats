# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
HEROES = ['Bastion', 'D.Va', 'Genji', 'Hanzo',
          'Junkrat',  'Lúcio', 'McCree', 'Mercy',
          'Pharah', 'Reaper', 'ReinHardt', 'Roadhog',
          'Soldier: 76', 'Symmetra', 'Torbjörn',
          'Widowmaker', 'Winston', 'Zarya', 'Zenyatta', 'Tracer', 'Mei']
HEROES.each do |name|
  Hero.create(name: name)
end
