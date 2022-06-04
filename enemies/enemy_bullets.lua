ice_balls = {}

red_attack_time = 160

function lich_attack_ice(enemy)
	enemy.timer += 1
	red_attack_time -= 1
	if enemy.timer == enemy.interval then

		
		local spr = 247
		local spd = .5
		local ii = 0

		if (enemy.red_attack) then
			spr = 231
			spd = .9
			ii = 7
		end

		for i=0,ii do
			local e = {
						sprite = spr,
						death_sprite = 103,
						speed = spd, 
						hp = 1,
						dmg = 15
						} 
			local ph = random_outside_point(1/8*i, 64, enemy.pos.x, enemy.pos.y)
			if (not enemy.red_attack) then
				ph.x = playerx
				ph.y = playery
			else
   				sfx(22)
			end
		    local pt = angle_move(enemy.pos.x, enemy.pos.y, ph.x, ph.y, 256)

			if (enemy.red_attack and red_attack_time < 90) then
				enemy.interval = 320
    			 pt = angle_move(enemy.pos.x, enemy.pos.y, playerx, playery, 256)
				if (enemy.red_attack and red_attack_time <= 0) then
					enemy.interval = 10
					red_attack_time = 160
				end
			end
		
			e.aoe=4
			e.no_collision = true
			e.pos=point(enemy.pos.x,enemy.pos.y)
			e.life_time = 180
			e.targetx = pt.x+playerx
			e.targety = pt.y+playery

			add(enemy_bullets,e) 
		
			enemy.timer = 0
		end

	end
end

