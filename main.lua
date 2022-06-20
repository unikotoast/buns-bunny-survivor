is_draw = 0

kills = 0

function _init()
	map_setup()
    setup_hair()
	bullet_homing ={}
	enemies = {}
	start_setup()
end

function _update60()
	if ( not show_lvlup) then
		obj.x = playerx
		obj.y = playery+4
		enemy_update()
		move_player()
		move_bullets()
		move_particles()
		cooldown_update()
		ring_fire_damage()
		update_lightning()
		move_gems()
		if (not start) update_timer()
		else choose_weapon_buttons() 
	end
end

function _draw()
	cls()
	draw_map()
	draw_gems()
	if (not show_lvlup) then
		facing = 0
		if (playerflip) facing = -4
		if (playerang==.25) facing = -3
		draw_bullets()
	end
	draw_bugs()
	if (playerang ~= .75) draw_player()
		draw_hair(obj, facing)
	if (playerang == .75) draw_player()
	animate_animations()
	ring_fire_damage_draw()
	draw_enemy_bullets()
	draw_particles()
	if (not start) then

		draw_player_bars()
		draw_weapons_ui()
		if (not show_lvlup or game_over) then
			draw_timer()
		end
	end
	if (start) then
		draw_manual()
	end

	draw_items()
	draw_text()
--print("kb"..stat(0),(playerx)-64,(playery)-57,2)
--print("∧"..flr(100*stat(1)).."%",(playerx)-64,(playery)-50,2)
--print(""..playerhp,playerx+42,playery-52,7)
--print("max"..max_exp,playerx+42,playery-46,7)
end

timer = 0
timer_frames = 0

function update_timer()
	timer_frames += 1
	if (timer_frames == 60) then
		timer_frames = 0
		timer += 1
 	end
 	enemy_level = flr(timer / 30)
end

function draw_timer()
	local minutes = flr(timer / 60)
	local seconds = flr(timer  % 60)
 	print(minutes..":"..seconds,(playerx-2),(playery)-54,6)
end


