fire_rounds = 1

w_wand = 		{enabled = false, lvl = 0,  cd = 0, interval = 90, dmg = 5, speed = .25, duration=105, sprite=66, name="mAGIC wAND", 
				attack_start = function(self) attack_magic(self) end}

function attack_magic()

	if (w_wand.cd == 0) then--  and p_energy - 5 > 0) then
	--	energy_cd = 30
		w_wand.cd = 0
	--	p_energy -= 5


--w_wand.timer += 1
--if w_wand.timer == w_wand.interval then
		local enemy = rnd(bugs)-- bugs[1]--
		local homex = 0
		local homey = 0
		if (enemy != nil) then
         	local pt = angle_move(enemy.pos.x, enemy.pos.y, playerx, playery, 256)
			homex = enemy.pos.x - pt.x
			homey = enemy.pos.y - pt.y
		end

--sfx(0)
		local k = {
			x = playerx, 
			y = playery-4+rnd(8), 
			sprite = 103, 
			direction=6, 
			dmg = w_wand.dmg, 
			speed = w_wand.speed, 
			duration=w_wand.duration, 
			is_flipx = false, 
			is_flipy = false, 
			go_through=1,
			start_animation = 35,
			animate_death=true,
			homex = homex,
			homey = homey,
			hx = playerx + 32 -rnd(64),
			hy = playery + 32 -rnd(64),
			angle=90
		}
		add(bullet_homing, k)
--sfx(2)


		w_wand.interval = 3
		fire_rounds -= 1
		if (fire_rounds == 0) then
			w_wand.interval = 140
			fire_rounds = w_wand.lvl*2 + 10
		end
		w_wand.firing = false
end
end

function move_homing_bullets()

	for b in all(bullet_homing) do

		local hx = b.homex
		local hy = b.homey

		if (b.start_animation > 0) then
			b.speed *=.93
			hx = b.hx
			hy = b.hy
			b.start_animation -= 1
		else

		b.speed *=1.06
		end

         local p = angle_move(b.x, b.y, hx, hy, b.speed)
		
         	 b.x+=p.x
         	 b.y+=p.y

		b.speed *=1.04
		if (b.speed > 2) b.speed = 2
		b.duration -= 1

		local p = point(b.x,b.y)
		for enemy in all(bget(bugstore, p)) do
			b.go_through -=1
			deal_damage(enemy, b.dmg)
		end
		
		if (b.duration <= 0 or b.go_through <= 0) then
		add_timed_anim(b.sprite,b.x,b.y,3,9)
			del(bullet_homing,b)
		end

		add_particle(b.x+4,b.y+2+rnd(4),7,6)
	end
end
