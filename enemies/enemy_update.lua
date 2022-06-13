
anim_2frames_dur = 0

enemy_bullets = {}

function enemy_update()
	store_enemies()
	move_enemies()
	move_enemy_bullets()
	wave_update()
end

function draw_enemy_bullets()
	for e in all(enemy_bullets) do
		draw_enemy_object(e)
	end
end

function draw_bugs()
	for e in all(enemy_bullets) do
		if (e.is_cloud) then
				spr(19,e.pos.x,e.pos.y+26)
			end
	end
			
	for e in all(bugs) do
		draw_enemy_object(e)
	end
	anim_2frames_dur+=1
end

function draw_enemy_object(e)
	if (e.damaged and e.damaged > 0) then
		for i = 0,15 do 
			pal(i, 14) 
		end
	end

	if (e.draw_black) then
		palt(0,false)
		palt(1,true)
	end

	if (e.skull and e.hp > 10) then
		local sprite = 11
		if (e.hp == 20) sprite = 12
		if (e.hp == 10) sprite = 13
		spr(sprite,e.pos.x,e.pos.y)
	else
		if (e.sprite == -1) then
				local ssx = e.sx +e.next_sx
				if (anim_2frames_dur <8) then
					ssx = e.sx
				elseif (anim_2frames_dur >=16) then
					anim_2frames_dur=0
				end
					sspr(ssx, e.sy, e.sw, e.sh, e.pos.x-5, e.pos.y-5, e.sw, e.sh, e.is_flipped)
		else
				local an = 0
				if (anim_2frames_dur <8) an = 1
				if (anim_2frames_dur >=16) anim_2frames_dur=0
				spr(e.sprite+an,e.pos.x,e.pos.y,  1, 1, e.is_flipped)
		end
	end

	if (e.draw_black) then
		palt()
	end
	pal() 
	if (e.damaged) then
		e.damaged -= 1
		if (e.damaged <= 0) then
			e.damaged = 0
		end
	end

		if (e.max_speed and e.speed < e.max_speed) then
			e.speed = min(e.max_speed, e.speed*1.01)
			spr(167,e.pos.x,e.pos.y)
		end
end

function remove_bullet(e)
	del(enemy_bullets,e)
	--add_timed_anim(e.death_sprite,e.pos.x,e.pos.y,3,12)
end

function move_enemies()
	for e in all(bugs) do
		move_e(e)
		bump_move(e)
	end
end

function move_enemy_bullets()
	for e in all(enemy_bullets) do
		move_e(e)
	end
end

function move_e(e)
	if (not e.is_cloud and e.life_time <= 0) then
		if (e.no_collision) then
			remove_bullet(e)
		else
			remove_enemy(e)
		end
		return
	end

	if (not e.is_cloud) e.life_time -= 1

	if (not e.no_collision and not e.is_swarm) then
		e.targetx = playerx
		e.targety = playery
	end
	if (e.is_cloud) then
		e.targetx = playerx
		e.targety = playery - 16
	end

     local p = angle_move(e.pos.x, e.pos.y, e.targetx, e.targety, e.speed)

     e.pos.x+=p.x
     e.pos.y+=p.y
       

      if (not e.is_cloud and e.no_collision and e.targetx==e.pos.x and e.targety==e.pos.y) then
		remove_bullet(e)
      end

	if (not e.no_collision and not e.is_swarm) then
 		local is_in_camera = teleport_enemy_out_of_camera(e)

		if (is_in_camera) then
			if (e.pos.x > playerx) then 
				e.is_flipped = true
			end
	
			if (e.pos.x < playerx) then 
				e.is_flipped = false
			end
	
		end

	end

	if (e.can_attack) then
		e:attack(e)
	end
		
	if not e.is_cloud and dst(playerx,playery,e.pos.x,e.pos.y) < e.aoe then
		if (e.is_bomb or e.skull) then
			kill_enemy(e)
		elseif (not e.is_crystal and e.death_item and e.is_bunny) then
			remove_enemy(e)
			make_gems()
   			sfx(23)
			player_damaged = 90
			player_damaged_dash = true
			dash_cooldown = dash_cooldown_max
			use_carrot()
		elseif (not dash and e.no_collision) then
			damage_player(e.dmg)
			remove_bullet(e)
		--elseif (dash and fire_dash and e.dash_id ~= dash_id) then
		--	e.dash_id = dash_id
		--	deal_damage(e, 40)
		else
			playerx += (playerx - e.pos.x)/15
			playery += (playery - e.pos.y)/15
			if (player_damaged_dash) then
				deal_damage(e, .5)
			else
				damage_player(e.dmg)
			end
		end
	end
end

function make_gems(x,y,g)
	local gems = g or 7
	for i=0,gems do
		local p = random_outside_point(i/gems,20,x,y)
		make_gem(p.x,p.y)
	end
end

function teleport_enemy_out_of_camera(e)
	if not e.no_teleport and dst(playerx,playery,e.pos.x,e.pos.y) > 96 then
		teleport_enemy_out(e)
		return false
	else
		return true
	end
end

function teleport_enemy_out(e)
	local p = random_outside_point()
		e.pos.x=p.x
		e.pos.y=p.y
end
