# reflex-game-turing

![typemaster](https://github.com/ridhwaans/reflex-game-turing/raw/master/images/typemaster.png)

## Synopsis

`reflex-game-turing` is a text reflex game from TEE201 '07. It's written in Turing and titled ‘The TypeMaster’ in-game. Inspired by guitar hero karaoke

## Rules of the Game

The point of the game is to play on the player's reflex. The player is binded to use the up (red), down (green), left (orange), and right (yellow) arrow keys to input correct color combinations, and to score points.  The score increases by 100 each time the correct arrow key is pressed at the correct time, and the score decreases by 25 each time the player does not hit the correct arrow key at the right time. Pressing any other keys besides the arrow keys will not affect the score and the colors. If the player gets a high score and then drops to a low score, the high score is recorded. For example, if the player scores 500 and then drops to 400 due to an incorrect input, the best score (500) is recorded until it is beaten by a higher score. The player wins the game if he/she scores 1000 points and the player loses if he/she gets -150 points

### Controls

The player can input key combinations for the color sequence through the arrow keys. Use the ‘up arrow key’ to control the red color, the ‘down arrow key’ to control the green color, the ‘left arrow key’ to control the orange color, and the ‘right’ arrow key’ to control the yellow color.

![led_sequence](https://github.com/ridhwaans/reflex-game-turing/raw/master/images/led_sequence.png)

### Prerequisite
Place a game music file in the root directory and edit line 29 (`Music.PlayFile ("filename.mp3")`) in the program 


### Exit criteria
The player wins the game if he/she scores 1000 points and the player loses if he/she gets -150 points
