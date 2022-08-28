
playerflip=false
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
player_push = 0
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
	 if ( player_push == 0) then
	if(btn(⬅️)) then
		is_moving = true
		playerflip = true
		playerang = .5
	end
	if(btn(➡️)) then
		is_moving = true
		playerflip = false
		playerang = 1
	end
	if(btn(⬆️)) then
		is_moving = true
		if( btn(⬅️)) then
			playerang = .375
		elseif( btn(➡️)) then
			playerang = .125
		else
			playerang = .25
		end
	end
	if(btn(⬇️)) then
		is_moving = true
		if( btn(⬅️)) then
			playerang = .625
		elseif( btn(➡️)) then
			playerang = .875
		else
			playerang = .75
		end
	end
	end
	if (is_moving) then
		--if (player_focus < 100) then
		--	player_focus += 1
		--end
		player_speed += max(playeracc, .01)
	elseif (player_push > 0) then
		player_push -= 1
		player_speed -= max(playeracc, .01)
		if (player_push<=0)player_push=0
		--if (player_focus > 0) then
		--	player_focus -= 1
		--end
	end

	if(btnp(4)) then
			if((dash_cooldown >= dash_cooldown_max)) then
			frost_dash()
--			player_focus = min(100, player_focus + 60)
			player_damaged += 45
			if (frosty_dash) player_damaged += 45
			player_damaged_dash = true
			dash = true
			dash_id = rnd()
			dash_cooldown = 0
			player_speed=.6
	
			if (fire_dash) then
				player_speed*=40
			else
				player_speed*=20
			end
		
			sfx(6)
		else
			sfx(25)
		end
	end


end


function dash_move()
--if (w_magic_wand > 0) then
--	for i = 1, w_magic_wand do
--		attack_magic()
--	end
--end
	if (dash_timer % 1 == 0) then
		if (fire_dash) then
			aoe_damage(playerx,playery, 16,30,118)
			add_explosion(playerx,playery+4,6,0)
		end
		local spr = 22
		if (frosty_dash) spr = 16
		add_timed_anim(spr,playerx,playery,3,9, playerflip)
	end

	dash_timer -= 1

	if (dash_timer <= 0) then
		shake = 0
		dash = false
		frost_dash()
		dash_timer = 5
	end


player_speed*=.6
end


function interact(x,y)
	if (dst(playerx,playery,0,0) > map_size) then
		if (start) then
			player_push = 10
			player_speed-= 3
		else
			damage_player(1)
		end
	end
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