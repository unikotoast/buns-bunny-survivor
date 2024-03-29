items = {}

function use_damage_boost(self) 
   	sfx(14)
   	carrot_damage_boost_timer = 500
	delete_item(self)
	use_carrot()
end

function make_damage_boost(x,y) 
	make_item(218,x,y, use_damage_boost)
end

function use_peach(self) 
   			sfx(13)
	player_damaged += 30
	player_damaged_dash = true
	dash_cooldown = dash_cooldown_max
	playerhp += 1
	if (playerhp > playerhp_max) playerhp = playerhp_max
	delete_item(self)
end

function use_carrot(self)
   	if (p_energy < p_energy_max) p_energy = p_energy_max
	p_energy += 1
--	if (p_energy > p_energy_max) p_energy = p_energy_max
	if (self) then
   		sfx(14)
		delete_item(self)
	end
end

function use_magnet(self)
   			sfx(15)
	magnet_effect = true
	for gem in all(gems) do
		gem.picked = true
	end
	delete_item(self)
end

function delete_item(item)
	del(animations, item.anim)
	del(items, item)
end

function make_item(sprite,x,y,use)
	local anim = {sprite = sprite, x = x, y =y, step = 0, interval = 45, frame = 0, frames = 1, timer = false}
	add(animations, anim)
	add(items,  {time = 12000, x = x, y =y, anim = anim, use = use})
end

function make_magnet(x,y) 
	make_item(122,x,y, use_magnet)
end

function make_peach(x,y) 
	make_item(196,x,y, use_peach)
end

function make_carrot(x,y) 
	make_item(68,x,y, use_carrot)
end

function draw_items()
	for i in all(items) do
		i.time -=1
        if (i.time < 0 ) delete_item(i)
	end

	if (magnet_effect) then
		draw_magnet_effect()
	end
end


