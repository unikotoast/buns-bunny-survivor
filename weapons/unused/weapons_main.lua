w_knife = 		{enabled = true, interval = 80, dmg = 10, speed = 3, duration=36, sprite=79, 
				name="cARROTS", info="more carrots\nhit through enemies", 
				attack_start = function(self) throw_knife(self) end}
w_wand = 		{enabled = false, interval = 90, dmg = 10, speed = .45, duration=75, sprite=66, name="mAGIC wAND", 
				attack_start = function(self) attack_magic(self) end}
w_slash = 		{enabled = true, interval = 60, dmg = 20, speed = 1, duration=15, sprite=64, 
				name="sWORD", info="more carrots\nhit through enemies", 
				on_draw = function(self) on_draw_slash() end, 
				attack_start = function(self) fire_slash(self) end}
w_lightning = 	{enabled = false,  interval = 120, dmg = 25, speed = 2, duration=30, sprite=67, name="tHUNDER sTAFF", 
				attack_start = function(self) attack_lightning(self) end}
w_beam = 		{enabled = false, interval = 90, dmg = 15, speed = 2, duration=30, sprite=69, name="bEAM sTAFF", on_draw = function(self) on_draw_beam() end, 
				attack_start = function(self) fire_beam(self) end}
w_cat = 		{enabled = false, interval = 300, dmg = 15, speed = 2, duration=30, sprite=117, name="cUTE cAT", on_draw = function(self) draw_cat() end, 
				attack_start = function(self) put_cat(self) end}
w_parfait = 	{sprite=212, 
				name="pARFAIT", info="heals 50HP and 50MP\nmakes 4 peaches", use =  function(self) use_parfait(self) end}

_weapons = {w_knife, w_slash, w_parfait}

for w in all(_weapons) do
	w.timer = 0
	w.lvl = 1
	--w.enabled
end

function weapons_update()
	--for w in all(_weapons) do
	--	if (w.enabled) then
	--		w.timer += 1
	--		if w.timer >= w.interval then
	--			w.firing = true
	--			w.timer = 0
	--		end
	--		if (w.firing) then
	--				w:attack_start()
	--			--if (w.rounds == nil) then
	--			--	w:attack_start()
	--			--else
	--			--	attack_round(w)
	--			--end
	--		end
	--	end
	--end
end

function weapons_draw()
	for w in all(_weapons) do
		if (w.enabled and w.firing and w.on_draw) then
			w:on_draw()
		end
	end
end


--function attack_round(w)
--
--	if (w.round_interval == 0 or w.round_interval == w.round_interval_max) then
--		w:attack_start()
--		w.rounds -= 1
--		w.round_interval=w.round_interval_max
--	end
--
--	if (w.rounds == 0) then
--		w.rounds = w.lvl * w.rounds_increase
--		w.firing = false
--	end
--
--	w.round_interval -= 1
--end


function deal_damage(enemy, dmg)
--	add_frames_animation(enemy.pos.x+2-rnd(4), enemy.pos.y+2-rnd(4), 4, 180, false)
	enemy.hp -=dmg
	if (enemy.hp <= 0) then
		kill_enemy(enemy)
	else
			enemy.damaged = 3
	end
end
