# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Student.create( first_name: 'Joe', last_name: 'Slacker' )
Student.create( first_name: 'Jen', last_name: 'Latermore' )
PeerEval.create( milestone: 'Design', evaluatee: 'Jen Latermore', goals: 1, quality: 2, effort: 3, considerate: 4, knowledge: 5, sharing: 6, strength: 'leadership', weakness: 'time management' )
PeerEval.create( milestone: 'Design', evaluatee: 'Joe Slacker', goals: 6, quality: 5, effort: 4, considerate: 3, knowledge: 2, sharing: 1, strength: 'smart', weakness: 'people management' )
