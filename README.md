The Card Game War
==========================

1. Introduction
2. Playing the game

Introduction
------------

This is a simple implementation of the War card game for 2, 3 or 4
players.  The rules of the game can be found [here](https://www.pagat.com/war/war.html)

Playing the game
----------------

1. Clone repo

```
git clone git@github.com:cnemeth/war_card_game.git
```

2. cd into porject
```
cd war_card_game
```
3. Install gems
```
bundle install
```
4. Run game, n is the number of players (2, 3 or 4)
```
./war.rb n
```
5. To run specs, comment out ARGV block in bottom of war.rb  (shown below) and run
   `rake`
```
#ARGV.each do |v|
#  num_players = (2..4).include?(v.to_i) ? v.to_i : 2
#  game = War.new(num_players: num_players)
#  game.play
#end
```

EOF
