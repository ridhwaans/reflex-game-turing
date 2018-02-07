% The TypeMaster
%A reflex game created by Ridhwaan Shakeel and Ali Akber!

%This part declares all the variables.
var picID : int  %Variable for game background image
var firstname : string %Variable for player's first name
var score, highScore : int := 0 % Variables for score and highscore
var x, y : int %Variable for background image coordinates
var pausekey : char %Variable where player can press any key to continue
var r1, y1, g1, o1, r2, y2, g2, o2 : int %Variables for 2 rows of 4 colors (red-r1, r2, green- g1, g2, orange- o1, o2, yellow- y1, y2)
var chars : array char of boolean %Variable for input.KeyDown command (for arrow key controls)
var p : int %Variable to coordinate LEDs through parallelport
var input : string %Variable for player's choice to play again or not
var font1, font2, font3 : int %Variable for the font.draw command
var i : int := 0


%Font command. This section makes the some text in the game appealing. The font is 'Destine', the font size is 50, 20, 10 and the fonts are italic
font1 := Font.New ("destine:50:italic")
font2 := Font.New ("destine:20:italic")
font3 := Font.New ("destine:10:italic")
assert font1 > 0
assert font2 > 0
assert font3 > 0

%This part plays music once the program is executed till it is game over.
process playstuff
    loop
	Music.PlayFile ("filename.mp3")
    end loop
end playstuff

% The fork command plays music from the file while other activity is being performed.
fork playstuff

%This displays the game title screen. Please DO NOT press any key while this screen is being displayed because pressing keys will skip the instructions.
picID := Pic.FileNew ("blue space.jpg")
x := (0)
y := (0)
Pic.Draw (picID, x, y, picCopy)
Font.Draw ("Ridhwaan Shakeel's & Ali Akber's", 50, 250, font2, white)
Font.Draw (" The TypeMaster", 50, 192, font1, white)
Font.Draw ("A Relfex Game", 400, 170, font3, white)
delay (3000)
cls

%Game main menu. This part displays the objective, instructions and player controls, and song credit of the game. Please press any key ONLY after reading the instructions
put ""
put ""
put ""
put ""
put ""
put ""
put ""
put ""
put "                                  THE TYPEMASTER"
put "                 Welcome to Ridhwaan's and Ali's Relfex Game!"
put " The whole point of this game is to improve the player's reflex skills, reaction"
put " time and typing skills. Use the up (red), down(green), left(orange), and right"
put " (yellow) arrow keys to input correct color sequences and score points.The score"
put "increases by 100 each time the correct arrow key is pressed at the correct time,"
put "  and the score decreases by 25 each time the player does not hit the correct"
put "     arrow key at the right time. The player wins the game if he/she scores"
put "     1000 points and the player loses if he/she gets -150 points.Good Luck!"
put ""
put "                              press any key to continue"
put ""
put ""
put ""
pausekey := getchar
cls

%This part of the code asks for the player's first name for reference
Font.Draw ("Please enter your first name", 10, 350, font2, black)
get firstname
cls

%Game countdown
Font.Draw ("READY", maxx div 2 - 100, maxy div 2, font1, black)
delay (1000)
cls

Font.Draw ("3", maxx div 2, maxy div 2, font1, black)
delay (1000)
cls

Font.Draw ("2", maxx div 2, maxy div 2, font1, black)
delay (1000)
cls

Font.Draw ("1", maxx div 2, maxy div 2, font1, black)
delay (1000)
cls

Font.Draw ("GO", maxx div 2 - 30, maxy div 2, font1, black)
Font.Draw (firstname, maxx div 2 - 70, maxy div 2 - 70, font1, black)
delay (1000)
cls

%There are two loops here because one is the actual game and the other loop gives the option to the player whether he/she wants to play again after the game ends
loop

    loop

	% Background command
	picID := Pic.FileNew ("inside a pc.jpg")
	x := (0)
	y := (0)
	Pic.Draw (picID, x, y, picCopy)

	%Color randomizer command. the number 1 is when the color is turned on and the number 0 means the color is turned off
	r1 := Rand.Int (0, 1)
	y1 := Rand.Int (0, 1)
	g1 := Rand.Int (0, 1)
	o1 := Rand.Int (0, 1)

	%Declares second row of colors equal or same as the first row of colors.
	r2 := r1
	y2 := y1
	g2 := g1
	o2 := o1

	%This part coordinates the LED lights with the colors on the screen (red- 128, yellow- 8, green- 64, orange- 32)
	p := 0
	if r2 = 1 then
	    p := p + 128
	end if
	if y2 = 1 then
	    p := p + 8
	end if
	if g2 = 1 then
	    p := p + 64
	end if
	if o2 = 1 then
	    p := p + 32
	end if

	parallelput (p)

	%This part makes the score, highscore, the name of the player, and 'Next Sequence' appear at the beginning of the game.
	Font.Draw ("Score", 250, 370, font2, black)
	locatexy (350, 370)
	put score
	Font.Draw ("HighScore", 200, 340, font2, black)
	locatexy (350, 340)
	put highScore
	Font.Draw (firstname, 200, 275, font1, black)
	Font.Draw ("Next Sequence", 90, 200, font1, black)

	%Actual gameplay code starts here
	%First row of colors consisting of r1(red), y1(yellow), g1(green), and o1(orange)
	if r1 = 1 then
	    drawfilloval (150, 150, 25, 25, red)                    
	elsif r1 = 0 then
	    drawfilloval (150, 150, 25, 25, white)
	    drawoval (150, 150, 25, 25, black)
	end if

	if y1 = 1 then
	    drawfilloval (250, 150, 25, 25, yellow)
	elsif y1 = 0 then
	    drawfilloval (250, 150, 25, 25, white)
	    drawoval (250, 150, 25, 25, black)
	end if

	if g1 = 1 then
	    drawfilloval (350, 150, 25, 25, green)
	elsif g1 = 0 then
	    drawfilloval (350, 150, 25, 25, white)
	    drawoval (350, 150, 25, 25, black)
	end if

	if o1 = 1 then
	    drawfilloval (450, 150, 25, 25, 42)
	elsif o1 = 0 then
	    drawfilloval (450, 150, 25, 25, white)
	    drawoval (450, 150, 25, 25, black)
	end if
	delay (10)

	% Second row of colors consisting of r2(red), y2(yellow), g2(green), o2(orange)
	if g2 = 1 then
	    drawfilloval (350, 50, 25, 25, green)
	elsif g2 = 0 then
	    drawfilloval (350, 50, 25, 25, white)
	    drawoval (350, 50, 25, 25, black)
	end if

	if y2 = 1 then
	    drawfilloval (250, 50, 25, 25, yellow)
	elsif y2 = 0 then
	    drawfilloval (250, 50, 25, 25, white)
	    drawoval (250, 50, 25, 25, black)
	end if

	if r2 = 1 then
	    drawfilloval (150, 50, 25, 25, red)
	elsif r2 = 0 then
	    drawfilloval (150, 50, 25, 25, white)
	    drawoval (150, 50, 25, 25, black)
	end if

	if o2 = 1 then
	    drawfilloval (450, 50, 25, 25, 42)
	elsif o2 = 0 then
	    drawfilloval (450, 50, 25, 25, white)
	    drawoval (450, 50, 25, 25, black)
	end if
	delay (800)

	%This part shows what happens to the color outline when it is turned off and when it is turned on.Drawfilloval fills the circle white when the color is currently turned off and drawoval is the black outline of the circle
	drawfilloval (150, 150, 25, 25, white)
	drawfilloval (250, 150, 25, 25, white)
	drawfilloval (350, 150, 25, 25, white)
	drawfilloval (450, 150, 25, 25, white)
	drawoval (150, 150, 25, 25, black)
	drawoval (250, 150, 25, 25, black)
	drawoval (350, 150, 25, 25, black)
	drawoval (450, 150, 25, 25, black)

	%This delay makes the next color sequence appear in a short time(about 1 second)
	delay (1000)

	%Game controls. The arrow keys are used to control the colors (red-up arrow, green- down arrow, orange- left arrow, yellow- right arrow)
	Input.KeyDown (chars)
	if chars (KEY_UP_ARROW) and r2 = 1 then
	    score := score + 100
	end if

	Input.KeyDown (chars)
	if chars (KEY_RIGHT_ARROW) and g2 = 1 then
	    score := score + 100
	end if

	Input.KeyDown (chars)
	if chars (KEY_LEFT_ARROW) and o2 = 1 then
	    score := score + 100
	end if

	Input.KeyDown (chars)
	if chars (KEY_DOWN_ARROW) and y2 = 1 then
	    score := score + 100
	end if

	%If any other arrow key is pressed when the 'r' key needs to be pressed then score decreases by -25
	Input.KeyDown (chars)
	if chars (KEY_RIGHT_ARROW) and r2 = 1 then
	    score := score - 25
	end if

	Input.KeyDown (chars)
	if chars (KEY_LEFT_ARROW) and r2 = 1 then
	    score := score - 25
	end if

	Input.KeyDown (chars)
	if chars (KEY_DOWN_ARROW) and r2 = 1 then
	    score := score - 25
	end if

	%If any other arrow key is pressed when the 'g' key needs to be pressed then score decreases by -25
	Input.KeyDown (chars)
	if chars (KEY_UP_ARROW) and g2 = 1 then
	    score := score - 25
	end if

	Input.KeyDown (chars)
	if chars (KEY_LEFT_ARROW) and g2 = 1 then
	    score := score - 25
	end if

	Input.KeyDown (chars)
	if chars (KEY_DOWN_ARROW) and g2 = 1 then
	    score := score - 25
	end if

	%If any other arrow key is pressed when the 'o' key needs to be pressed then score decreases by -25
	Input.KeyDown (chars)
	if chars (KEY_UP_ARROW) and o2 = 1 then
	    score := score - 25
	end if

	Input.KeyDown (chars)
	if chars (KEY_RIGHT_ARROW) and o2 = 1 then
	    score := score - 25
	end if

	Input.KeyDown (chars)
	if chars (KEY_DOWN_ARROW) and o2 = 1 then
	    score := score - 25
	end if
	%If any other arrow key is pressed when the 'y' key needs to be pressed then score decreases by -25
	Input.KeyDown (chars)
	if chars (KEY_UP_ARROW) and y2 = 1 then
	    score := score - 25
	end if

	Input.KeyDown (chars)
	if chars (KEY_RIGHT_ARROW) and y2 = 1 then
	    score := score - 25
	end if

	Input.KeyDown (chars)
	if chars (KEY_LEFT_ARROW) and y2 = 1 then
	    score := score - 25
	end if

	%This part updates the highscore if the score exceeds the highscore
	if score > highScore then
	    highScore := score
	end if

	%This part is where if the player scores more than 1000 points or less than -150 points, he/she exits the game. After exiting, the final status (win/lose) and the final score is displayed for the player.
	if score < -150 then
	    cls
	    put firstname, ", your final score is ", score, "!", " YOU LOSE!"
	    exit
	end if
	if score > 1000 then
	    cls
	    put firstname, ", your final score is ", score, "!", " YOU WIN!"
	    exit
	end if
    end loop
    %End of actual game

    %This part is where the player gets a choice whether he/she gets to play again or not.
    put "Thank you for playing Ridhwaan Shakeel's and Ali Akber's reflex game!"
    put "Play again? Please press 'y' to play again or any other key to end the game"

    get input
    if input = "y" or input = "Y" then
	score := 0
    else
	put "Good Bye! Thank you for playing Ridhwaan and Ali's relfex game!"
	delay (2000)
	exit
    end if
end loop
%End of game syntax
