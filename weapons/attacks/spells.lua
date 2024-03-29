w_lightning = 0
lightning_time = 180

function setup_cloud()
	cloud = {
		sprite = 37,
		death_sprite = 38,
		speed = .14 + w_lightning *.04, 
		is_cloud = true,
		no_collision = true,
		targetx = playerx,
		targety = playery,
		pos=point(playerx,playery)
	}
	add(enemy_bullets, cloud) 
end

function update_lightning()
	if (w_lightning > 0) then
	--	for e in all(enemy_bullets) do
	--		if (e.is_cloud) then
				lightning_time -= 1
				if (lightning_time <= 0) then
					lightning_time = 200 - w_attack_speed*25
					cloud.sprite = 37
					attack_lightning()
				elseif (lightning_time <= 55) then
					cloud.sprite = 39
				end
	--		end
	--	end
	end
end

function attack_lightning()
	--for e in all(enemy_bullets) do
	--	if (e.is_cloud) then
			local x1 = cloud.pos.x
			local y1 = cloud.pos.y
			
			for i=1,3 do
				add_timed_anim(55+flr(rnd(4)),x1,y1-2+ 8*i, 3,9)
			end
			aoe_damage(x1,y1+24, 10+5*w_lightning,11+3*w_damage+4*w_lightning,56)
			add_explosion(x1, y1+28,10+5*w_lightning,0,false,false,true, .1)
	--	end
	--end
end

ring_of_fire = 0
ring_of_fire_tick = 0

function ring_fire_damage()
	if (ring_of_fire > 0) then
		ring_of_fire_tick+=1
		if (ring_of_fire_tick >= 16-w_attack_speed) then
			ring_of_fire_tick = 0
			aoe_damage(playerx,playery, 20 + 3* ring_of_fire,.9+w_damage/3+ring_of_fire/2,118)
		end
	end

end

function ring_fire_damage_draw()
	if (ring_of_fire > 0) then
		local p = random_outside_point(rnd(),rnd(16)+5* ring_of_fire)
		add_particle(p.x+4,p.y+8, rnd({8,9,10}), ring_of_fire*5)
	end
end
frost_timer = 0
frost_x = 0
frost_y = 0

function frost_dash() 
	if (frosty_dash) then
		frost_x = playerx
		frost_y = playery
		
		for e in all(bugs) do
			if (dst(frost_x,frost_y,e.pos.x,e.pos.y) < 28) then
				e.speed = .01
			end
		end
		add_explosion(frost_x, frost_y,24,0,false,false,true)
	end
end
