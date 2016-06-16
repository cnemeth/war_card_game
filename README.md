The Card Game War
==========================

1. Introduction
2. Rules for 2 players
3. Rules for 3 or 4 players
4. Playing the game
5. References

Introduction
------------

This is a children's game played in many parts of the world. No strategy
is involved - simply the ability to recognise which of two cards is
higher in rank, and to follow the procedure of the game. The standard
two-player game is described first, then the game for three or four
players.

Rules for 2 players
-------------------

In the basic game there are two players and you use a standard 52 card
pack. Cards rank as usual from high to low: A K Q J T 9 8 7 6 5 4 3 2.
Suits are ignored in this game.

Deal out all the cards, so that each player has 26. Players do not look
at their cards, but keep them in a packet face down. The object of the
game is to win all the cards.

Both players now turn their top card face up and put them on the table.
Whoever turned the higher card takes both cards and adds them (face
down) to the bottom of their packet. Then both players turn up their
next card and so on.

If the turned up cards are equal there is a war. The tied cards stay on
the table and both players play the next card of their pile face down
and then another card face-up. Whoever has the higher of the new face-up
cards wins the war and adds all six cards face-down to the bottom of
their packet. If the new face-up cards are equal as well, the war
continues: each player puts another card face-down and one face-up. The
war goes on like this as long as the face-up cards continue to be equal.
As soon as they are different the player of the higher card wins all the
cards in the war.

The game continues until one player has all the cards and wins. This can
take a long time.

Most descriptions of War are not clear about what happens if a player
runs out of cards during a war. There are at least two possibilities:

1. If you don't have enough cards to complete the war, you lose. If neither
player has enough cards, the one who runs out first loses. If both run
out simultaneously, it's a draw. Example: Players A and B both play
sevens, so there is a war. Each player plays a card face down, but this
is player B's last card. Player A wins, since player B does not have
enough cards to fight the war.

2. If you run out of cards during a war, your last card is turned face up
and is used for all battles in that war. If this happens to both players
in a war and their last cards are equal, the game is a draw. Example:
Players A and B both play sevens, so there is a war. Player A plays a
card face down, but player B has only one card, so it must be played
face up. It is a queen. Player A plays a card face up and it is also a
queen, so the war must continue. Player B's queen stays (B's last card)
while player A plays a card face down and one face up, which is a nine.
Player B wins the war and takes all these seven cards (the five cards
that A played and the two cards that B played) and the game continues
normally.

Rules for 3 or 4 players
-----------------------------

War can also be played by three or more players in much the same way.
Deal out as many as possible of the cards so that everyone has an equal
number (17 for 3 players, 13 for 4).

All players simultaneously turn over a card and the highest wins all the
cards tuned up. If two or more players tie for highest there is a war -
everyone plays their next card face-down and then turns up a third card.
This continues until one of the face-up cards is higher than all the
others, and then that player wins all the cards in a war.

Note that all players take part in a war, not only the ones who had the
highest cards.

A player who runs out of cards drops out. The game goes on until only
one player has cards, and that player wins.

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

References
----------

```
[1]: https://www.pagat.com/war/war.html
[2]: https://en.wikipedia.org/wiki/War_(card_game)
```

EOF
