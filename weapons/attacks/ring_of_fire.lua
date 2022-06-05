ring_of_fire = 0
ring_of_fire_tick = 0

function ring_fire_damage()
	if (ring_of_fire > 0) then
		ring_of_fire_tick+=1
		if (ring_of_fire_tick == 10-w_attack_speed) then
			ring_of_fire_tick = 0
			aoe_damage(playerx,playery, 12 + 6* ring_of_fire,.6+w_damage/3+ring_of_fire/2)
		end
	end

end

function ring_fire_damage_draw()
	if (ring_of_fire > 0) then
		local p = random_outside_point(rnd(),rnd(12)+6* ring_of_fire)
		add_particle(p.x+4,p.y+8, rnd({8,9,10}), ring_of_fire*8)
	end
end