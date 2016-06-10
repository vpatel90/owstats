# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
HEROES = {'Bastion': 15, 'D.Va': 22, 'Genji': 21, 'Hanzo': 16,
          'Junkrat': 2,  'Lúcio': 3, 'McCree': 6, 'Mercy': 17,
          'Pharah': 11, 'Reaper': 8, 'Reinhardt': 12, 'Roadhog': 1,
          'Soldier: 76': 4, 'Symmetra': 13, 'Torbjörn': 14,
          'Widowmaker': 9, 'Winston': 10, 'Zarya': 5, 'Zenyatta': 18, 'Tracer': 7, 'Mei': 20}
HEROES.each do |key, value|
  Hero.create(name: key, api_id: value)
end

#1 Roadhog
#2 Junkrat
#3 Lúcio
#4 Soldier: 76
#5 Zarya
#6 McCree
#7 Tracer
#8 Reaper
#9 Widowmaker
#10 Winston
#11 Pharah
#12 Reinhardt
#13 Symmetra
#14 Torbjörn
#15 Bastion
#16 Hanzo
#17 Mercy
#18 Zenyatta
#19
#20 Mei
#21 Genji
#22 D.Va
