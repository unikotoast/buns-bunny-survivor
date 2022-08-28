bugs = {}

function wave_update()
	for wave in all(enemy_waves) do
		if (timer > wave.start_time) then
			if (wave.count > 0) then
				spawn_wave(wave)
			else
				del(enemy_waves, wave)
			end
		end
	end
end

function spawn_wave(wave)
	if (wave.is_swarm) then
		local p = random_outside_point() 
		local pt = angle_move(p.x, p.y, playerx, playery, 256)
		for i=1,wave.count do
			local e = wave:create_unit()
			setup_enemy(e)
			e.pos.x = p.x
			e.pos.y = p.y
			e.life_time = 300

			e.targetx=pt.x+playerx
			e.targety=pt.y+playery

			e.is_swarm = true

			e.is_flipped = e.pos.x > playerx


			add(bugs,e) 


		end
		wave.count = 0
	else
		wave.timer += 1

		if (wave.timer >= wave.interval) then
			local e = wave:create_unit()
			setup_enemy(e)
			wave.timer = 0
			wave.count -= 1
			if (not wave.is_wall) then
				teleport_enemy_out(e)
			else
				local p = random_outside_point(wave.count/wave.total_count,54)
				e.pos.x=p.x
				e.pos.y=p.y
			end
			add(bugs,e) 
		end
	end
end


function setup_enemy(enemy, life)
	if (enemy.is_bomb) then
		enemy.death_item = function()
   			sfx(12)
			add_explosion(enemy.pos.x,enemy.pos.y,25,8,true)
			enemy.exploded = true
			aoe_damage(enemy.pos.x,enemy.pos.y, 26,100,237,true)
		end
	end
	enemy.frame = 2
	enemy.max_speed = enemy.speed
	enemy.aoe=8
	enemy.dmg=1
	enemy.pos=point(0,0)
	if (not enemy.life_time) enemy.life_time = life or 3600
end

function kill_enemy(enemy)
	if (enemy.death_item) then
		enemy.death_item(enemy.pos.x,enemy.pos.y,enemy.gems) 
	else
		if (enemy.spawn) then
			for i = 1, enemy.spawn_count do
				local e = enemy:spawn()
				e.max_speed = e.speed
				e.bullet_id = enemy.bullet_id
				e.exploded = true
				e.aoe=6
				e.pos=point(enemy.pos.x,enemy.pos.y)
				add(bugs,e) 
			end
		else
			if (rnd() < .9) then
				make_gem(enemy.pos.x,enemy.pos.y)
			else
				if (rnd() < .8) then
					make_carrot(enemy.pos.x,enemy.pos.y)
				else
					make_damage_boost(enemy.pos.x,enemy.pos.y)
				end
			end
		end
	end
	kills += 1
	remove_enemy(enemy)
end

function remove_enemy(enemy)
	add_timed_anim(enemy.death_sprite,enemy.pos.x,enemy.pos.y,3,12)
	enemy.pos.x =0
	enemy.pos.y =0
	bstore(bugstore,enemy,true)
	del(bugs,enemy)
	store_enemies()
end

