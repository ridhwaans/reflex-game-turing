# reflex-game-turing

![typemaster](https://github.com/ridhwaans/reflex-game-turing/raw/master/images/typemaster.png)

## Synopsis

`reflex-game-turing` is a rhythm game from TEE201 '07. Inspired by guitar hero  

## Rules of the Game

The game is a speed test of player input and changing sequences. The player has the up (red), down (green), left (orange), and right (yellow) arrow keys to match color combinations and score points.  The player scores 100 points each time the correct key is pressed within time, and the score decreases by 25 each time the player does not hit the correct key before the color changes. High scores are recorded. The player wins the game if he/she scores 1000 points and the player loses if he/she gets -150 points. Put a music file in the root directory and edit line 29 (`Music.PlayFile ("filename.mp3")`) in the program 

### Controls

up arrow key `red`  
down arrow key `green`  
left arrow key `orange`  
right arrow key `yellow`  

![led_sequence](https://github.com/ridhwaans/reflex-game-turing/raw/master/images/led_sequence.png)

### Exit criteria
The player wins the game if he/she scores 1000 points and the player loses if he/she gets -150 points
