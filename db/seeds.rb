# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ted = Player.create({name: 'Ted'})
hazel = Player.create({name: 'Hazel'})
norman = Player.create({name: 'Norman'})

game = Game.create( player_1: ted, player_2: hazel, player_3: norman, dealer: norman)

hand = Hand.create( game_id: 1, p1_score: '1', p2_score: '2', p3_score: '5', bid: '4', trump: 'hearts', p1_status: 'stay', p2_status: 'stay', p3_status: 'bid')
  