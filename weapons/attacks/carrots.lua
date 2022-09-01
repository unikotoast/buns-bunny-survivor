knife_rounds = 1

bullet_tick = 0

w_attack_speed = 0
w_shuriken = 0
split_shot = 0
carrot_splash = 0

cloud_attack = false

drill_lvl = 1

carrot_damage = 10
carrot_damage_boost = 0
carrot_damage_boost_timer = 0

w_carrot_cd = 0
w_carrot_cd_max = 30

bullet_carrots ={}

function damage_boost_timer()
	if (carrot_damage_boost_timer > 0) then
		add_particle(playerx+rnd(8),playery+rnd(8), 10, 15,.1)
		carrot_damage_boost = 40
		carrot_damage_boost_timer -= 1
	else
		carrot_damage_boost = 0
	end
end

function throw_knife()
	if (w_carrot_cd == 0  and p_energy >= .5) then
		energy_cd = 50
		w_carrot_cd = max(w_carrot_cd_max,5)
		p_energy -= .5

		local knife_sprite = 102
		local flip_y = false
		if (playerang > .5 and playerang < 1) then 
			flip_y = true
		end

		if (playerang == .25 or playerang == .75) then 
			knife_sprite = 101
		end

		if (playerang % .125 == 0) then 
			knife_sprite = 100
		end

		if (w_shuriken > 0) then
			local sh = w_shuriken
			for i=0,sh*2 do
				if (i ~= sh) then
					local ang = playerang -.04*sh + i *.04
					make_bullet(ang, 125)
				end
			end
		end

		if (split_shot >= 1) then
			make_bullet(playerang + .5)
		end

		if (split_shot >= 2) then
			make_bullet(playerang + .25)
			make_bullet(playerang + .75)
		end

		if (split_shot >= 3) then
			if(bullet_tick%(6-split_shot) == 0) then
				for i=0,3 do
					make_bullet(playerang + .125+i*.25)
				end
			end
		end

		bullet_tick += 1
		if(bullet_tick > 10) then
			bullet_tick= 1
		end

		make_bullet(playerang)

	end


end

function make_bullet(angle,shuriken,x,y,id,pierce) 
	sfx(3)
	if (angle > 1) angle -= 1
		local sx = x or playerx
		local sy = y or playery
		local ph = random_outside_point(angle, 32, sx, sy)
		local pb = angle_move(sx, sy, ph.x, ph.y, 1.5)

		local sprite = 102
		if (angle >= .15 and angle <= .35) or (angle >=.65 and angle <=.85) then 
			sprite = 101
		end

		if ((flr((angle-0.025)*20)+1)%5~=0) then 
			sprite = 100
		end

		local speed = 1.88
		if (shuriken) speed = 2.5

		local dmg = carrot_damage+5*w_damage

		if (shuriken) dmg = 8+w_damage+w_shuriken*2

			local k = {
				x = sx, 
				y = sy, 
				pb = pb, 
				ang = angle,
				sprite = shuriken or sprite , 
				dmg = dmg+carrot_damage_boost, 
				speed = speed, 
				duration=36, 
				is_flipx = (angle >= .25 and angle <=.75), 
				is_flipy = (angle >= .5 and angle <= 1), 
				go_through= pierce or drill_lvl,
				start_animation = -1,
				bullet_id = id or rnd(10),
				animate_death=false,
				is_carrot = not shuriken
			}
			add(bullet_carrots, k)
end



function move_bullets()
	for b in all(bullet_carrots) do
		b.speed-=0.05
		b.x+=b.pb.x*b.speed
		b.y+=b.pb.y*b.speed

		b.duration -= 1
		local p = point(b.x,b.y)


		for e in all(bget(bugstore, p)) do

			if (e.bullet_id != b.bullet_id) then
					e.bullet_id = b.bullet_id
					deal_damage(e, b.dmg )

					b.go_through -=1
						add_timed_anim(106,b.x,b.y,1,4)
				end
		end


		if (b.duration <= 0 or b.go_through <= 0) then
			add_timed_anim(103,b.x,b.y,3,9)
			del(bullet_carrots,b)

			if (b.is_carrot and carrot_splash > 0) then
				add_explosion(b.x,b.y,4 + carrot_splash*3,2)
				aoe_damage(b.x,b.y, 12 + carrot_splash*3,carrot_damage_boost+(carrot_damage/4+carrot_splash*4),118)
			end

		end
	end
end