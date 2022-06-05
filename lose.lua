game_over = false
game_won = false

game_over_pause = 120

function game_lost()
   	sfx(17)
	game_over = true
	show_lvlup = true

	add_explosion(playerx,playery,28,16,false,true)
end

function win_game(x,y)
	add_explosion(x,y,28,16,false,true)
	music(0)
	game_won = true
	game_over = true
	show_lvlup = true
end

