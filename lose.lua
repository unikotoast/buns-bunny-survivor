game_over = false
game_won = false

game_over_pause = 90

function game_lost()
	game_over = true
	show_lvlup = true

	add_explosion(playerx,playery,28,16,false,true)
end

function win_game()
	game_won = true
	game_over = true
	show_lvlup = true
end

