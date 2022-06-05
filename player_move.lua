
playerflip=false
playerdir=2
playeracc=.084
playerdx=0
playerdy=0
is_moving=false

dash_energy = 50


dash_dmg = 0
dash_timer = 10
dash = false
dash_cooldown = 180
dash_cooldown_max = 180
magnet_area = 8

player_speed = 0
--player_focus = 0

function move_player()
	interact(playerx,playery)
    local ph = random_outside_point(playerang, 32)
    local pb = angle_move(playerx, playery, ph.x, ph.y, player_speed)

	playerx+=pb.x
	playery+=pb.y
	if (dash) then
		dash_move()
		return
	end
	player_speed *= .86

	if (dash_cooldown > dash_cooldown_max) then
		dash_cooldown = dash_cooldown_max
	else
		dash_cooldown += 1
	end

	is_moving = false

	--if(btn(4,1)) then
	--	level_up()
	--end
	if(btn(5)) then
	--	fire_slash(w_slash)
		throw_knife()
	end

	 creating_item = false
	if(btn(⬅️)) then
		is_moving = true
		playerflip = true
		playerdir = 4
		playerang = .5
		if (flr(playerx) % 8 == 0) then
 			create_map_outside_x(flr(playerx/8-9))
		end
	end
	if(btn(➡️)) then
		is_moving = true
		playerflip = false
		playerdir = 6
		playerang = 1
		if (flr(playerx) % 8 == 0) then
 		create_map_outside_x(flr(playerx/8+9))
		end
	end
	if(btn(⬆️)) then
		is_moving = true
		if( btn(⬅️)) then
			playerdir = 7
			playerang = .375
		elseif( btn(➡️)) then
			playerdir = 9
			playerang = .125
		else
			playerdir = 8
			playerang = .25
		end
		if (flr(playery) % 8 == 0) then
 			create_map_outside_y(flr(playery/8-9))
		end
	end
	if(btn(⬇️)) then
		is_moving = true
		if( btn(⬅️)) then
			playerdir = 1
			playerang = .625
		elseif( btn(➡️)) then
			playerdir = 3
			playerang = .875
		else
			playerdir = 2
			playerang = .75
		end
		if (flr(playery) % 8 == 0) then
 		create_map_outside_y(flr(playery/8+9))
		end
	end
	if (is_moving) then
		--if (player_focus < 100) then
		--	player_focus += 1
		--end
		player_speed += playeracc
--	else
		--if (player_focus > 0) then
		--	player_focus -= 1
		--end
	end

	if(btnp(4) and ((dash_cooldown >= dash_cooldown_max))) then
		dash_id = rnd(1)
--		player_focus = min(100, player_focus + 60)
		player_damaged = 45
		player_damaged_dash = true
		dash = true
		dash_cooldown = 0
		player_speed=.6
		player_speed*=20
	
		 sfx(6)
	end


end


function dash_move()
--if (w_magic_wand > 0) then
--	for i = 1, w_magic_wand do
--		attack_magic()
--	end
--end
	if (dash_timer % 1 == 0) then
		add_timed_anim(22,playerx,playery,3,9, playerflip)
	end

	dash_timer -= 1

	if (dash_timer <= 0) then
		shake = 0
		dash = false
		dash_timer = 5
	end


player_speed*=.6
end


function interact(x,y)
	--if (not dash) then
		for gem in all(gems) do
			if (dst(playerx,playery, gem.x,gem.y) < magnet_area) then
				gem.picked = true
				if (dst(playerx,playery, gem.x,gem.y) < 4) then
					get_exp()
					del(gems,gem)
				end
			end
		end
		for item in all(items) do
			if (dst(playerx,playery, item.x,item.y) < magnet_area) then
				item:use()
				del(items, item)
			end
		end
	--end
end