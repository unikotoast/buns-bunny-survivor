cat = nil
cat_attack =false
cat_attack_timer = 60
cat_attack_x = 0
cat_attack_y = 0
cat_flip = false

function put_cat()
	if (cat == nil) then
		cat = {}
		cat.x = playerx
		cat.y = playery

	else
	
	for e in all(bugs) do

		if (cat_attack) then

			if (cat_attack_timer % 20 == 0) then
				if is_point_in_rect(e.pos.x, e.pos.y,cat.x-24,cat.y-24,cat.x+24,cat.y+24) then
					--local death = {x=e.pos.x, y=e.pos.y,duration=9,timer=9,sprite=133 }
				--	add(death_animations,death)
			add_timed_anim(133,e.pos.x,e.pos.y,3,9)

					deal_damage(e, 10)
		
				end

			end
	else

			if is_point_in_rect(e.pos.x, e.pos.y,cat.x-12,cat.y-12,cat.x+12,cat.y+12) then
				cat_attack = true
				cat_attack_x = cat.x - 8
				cat_attack_y = cat.y - 8
			end
	end
		end
	end
end

function draw_cat()
	if (cat) then
		if (cat_attack) then
		spr(148, cat.x,cat.y, 1, 1, cat_flip, false)
		else
		spr(132, cat.x,cat.y)
		end
	end

	--for enemy in all(bget(bugstore, point(cat.x,cat.y))) do
	--	if (enemy) then
	--		sspr(40,64,8, 8, enemy.pos.x,enemy.pos.y, 24, 24, false, false)
	--	end
	--end


	
--	if (cat_attack) then
--		if (cat_attack_timer % 20 == 0) then
--			cat_attack_sprite_timer = 15
--			cat_attack_x = cat.x - 8 + rnd(16) 
--			cat_attack_y = cat.y - 8 + rnd(16) 
--			cat_flip = rnd({true, false})
--			cat_flip_y = rnd({true, false})
--			cat.x =cat_attack_x
--			cat.y =cat_attack_y
--
--		end
--
--		cat_attack_sprite_timer -= 1
--
--		if (cat_attack_sprite_timer > 10) then
--			sspr(40,64,8, 8, cat_attack_x,cat_attack_y, 20,20, cat_flip, cat_flip_y)
--		elseif (cat_attack_sprite_timer > 4) then
--			sspr(48,64,8, 8, cat_attack_x,cat_attack_y, 20,20, cat_flip, cat_flip_y)
--		elseif (cat_attack_sprite_timer > 0) then
--			sspr(56,64,8, 8, cat_attack_x,cat_attack_y, 20,20, cat_flip, cat_flip_y)
--
--		end
--
--
--		if (cat_attack_timer == 0) then
--		  		cat_attack = false
--		  		cat = nil
--			cat_attack_timer = 60*w_cat.lvl
--		end
--
--
--
--		cat_attack_timer -= 1
--	end
end