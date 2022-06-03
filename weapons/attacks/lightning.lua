w_lightning = 0
w_lightning_time = 200

function setup_cloud()
	cloud = {
		sprite = 37,
		death_sprite = 38,
		speed = .14 + w_lightning *.04, 
		follow = true,
		no_collision = true,
		pos=point(playerx,playery)
	}
	add(enemy_bullets,cloud) 
end

function update_lightning()
	if (w_lightning > 0) then
		w_lightning_time -= 1
		if (w_lightning_time <= 0) then
			w_lightning_time = 200
			cloud.sprite = 37
			attack_lightning()
		elseif (w_lightning_time == 55) then
			cloud.sprite = 39
		end

	end
end


function attack_lightning()
		local x1 = cloud.pos.x
		local y1 = cloud.pos.y
		
		for i=1,3 do
				add_timed_anim(55+flr(rnd(4)),x1,y1-2+ 8*i, 3,9)
		end
	
		for e in all(bugs) do
			if (dst(x1,y1+24,e.pos.x,e.pos.y) < 14+4*w_lightning) then
				add_timed_anim(55+flr(rnd(4)),e.pos.x,e.pos.y, 3,9)
				deal_damage(e, 6+3*w_damage+4*w_lightning)
			end
		end
end
