The Card Game War
==========================

1. Introduction
2. Playing the game

Introduction
------------

The rules of the game can be found [here](https://www.pagat.com/war/war.html)

Playing the game
----------------

1. Clone repo, cd into project folder and start IRb

```
git clone git@github.com:cnemeth/war_card_game.git
cd war_card_game
bundle
rake spec
irb
```

2. Define number of players, 2 - 4, in a hash

```
player_count = {num_players: 2}
```

3. Initialize game

```
game = War.new(player_count)
```

4. Start the game

```
game.play
```

5. Sample Output

```
...
The round winner is Carlos, with score: 7
The round winner is Carlos, with score: 13
The round winner is Carlos, with score: 6
The round winner is Dominique, with score: 13
The round winner is Dominique, with score: 11
War on!
The round winner is Carlos, with score: 9
The round winner is Carlos, with score: 3
The round winner is Carlos, with score: 14
War on!
War on!
Game Over! The winner is Carlos
```

EOF
