show_choose_window = false
selected_upgrade = 0
select_animation = 0
select_animation_reverse = true

main_weapon = w_knife

w_damage = 0
w_attack_speed = 0
w_move_speed = 0
w_magic_wand = 0
damage_dash = 0
vampirism = 0
w_arcane = false

player_skills = {}

p_energy_regen += .3


function setup_random_weapons() 
	random_weapons = {}
	local wr = {}
	for w in all(ws) do
		add(wr,w)
	end

	for i=1,4 do
		random = rnd(wr)
	    add(random_weapons, random)
	   del(wr, random)
	end
	selected_item = random_weapons[1]
end

function draw_weapons_ui()
	if (show_lvlup) then
		if (game_over) then
			local minutes = flr(timer / 60)
			local seconds = flr(timer  % 60)
			local txt = "yay! you won!"
			local bgclr = 14
			if (not game_won) then
				txt = "you lost"
				bgclr = 7
			end

text_bg(txt.."\n\nsurvived: "..minutes.." min. "..seconds.." sec.\n\nkills: "..kills.."\n\nexp: "..exp_total.."\n\n❎ x to restart",playerx-40 ,playery-30,bgclr)
		else
			choose_window_pause_t -= 1
			if (choose_window_pause_t <= 0) then
				choose_window_pause_t = 0
			end
			if (choose_window_t > 0) then
				choose_window_t-= 1
			else
  				show_choose_window = true
				draw_choose_window()
			end 
		end
		local i = 0
		for w in all(player_skills) do
			local item_y = 0
			local item_x = 0
			if (i > 8) then
				item_y = -16
				item_x = -108
			end
			spr(w.sprite,playerx-62+i*12+item_x,playery+34 + item_y)
			print(""..w.lvl,playerx-56+i*12+item_x ,playery+43 + item_y,15)
			i+=1
		end
	end
end

function draw_choose_window()
	rectfill(playerx-60,playery-56, playerx+60,playery-4, 7)
	rectfill(playerx-61,playery-55, playerx+61,playery-5,7)

	draw_weapon_row()

	if (select_animation_reverse) then
		select_animation +=0.1
	else
		select_animation -=0.2
	end
	if (select_animation<=0) then
		select_animation_reverse = true
	end
	if (select_animation>=2) then
		select_animation_reverse = false
	end

	spr(49,playerx-48+30*selected_upgrade,playery-31 + sin(t()%2))
end

function draw_weapon_row()
	local clrs = {12,14,7}

	for i=0,3 do
		local w = random_weapons[i+1]
		rectfill(playerx-54+30*i,playery-50, playerx-35+30*i,playery-30, 13)
		rectfill(playerx-55+30*i,playery-49, playerx-34+30*i,playery-31, 13)
		rect(playerx-57+30*i,playery-52, playerx-32+30*i,playery-28, 13)
		line(playerx-56+30*i,playery-27, playerx-33+30*i,playery-27, 6)
		spr(w.sprite,playerx-48+30*i,playery-43)

	end
	rect(playerx-67+30*selected_upgrade+10,playery-52, playerx-32+30*selected_upgrade,playery-28, 14)
 		print(selected_item.name,playerx-56,playery-20,0)
	if (selected_item.info) print(selected_item.info,playerx-56,playery-12,13)
 		
end

function choose_weapon_buttons() 
	if (game_over) then
		game_over_pause -= 1
		if (game_over_pause <= 0) then
			game_over_pause = 0
			if(btnp(4) or btnp(5)) then
				run()
			end
		end
		return
	end
	if(btnp(0)or btnp(2,1)) then
		if (selected_upgrade >0) selected_upgrade -=1
	elseif(btnp(1)or btnp(3,1)) then
		if (selected_upgrade <3) selected_upgrade +=1
	elseif(btnp(4) or btnp(5)) then
		if (choose_window_pause_t == 0) then
			show_choose_window = false
			show_lvlup = false
			selected_item = random_weapons[selected_upgrade+1]
			selected_item:use()
			if (selected_item.lvl)then
				selected_item.lvl += 1
			else
				if (selected_item.sprite ~= 127) then
					selected_item.lvl = 1
					add(player_skills,selected_item)
				end
			end
		end
	end
	selected_item = random_weapons[selected_upgrade+1]
end

function draw_player_bars()

	local heart = 215
	for i=0,playerhp_max-1 do
		if (i >= playerhp) then
			heart = 217
		end
		spr(heart,playerx-63+i*8,playery+48)
	end
	
	local carrot = 212
	for i=0,p_energy_max-1+.5 do
		if (i >= p_energy) then
			carrot = 214
		end
		if (p_energy-i==.5) then
			carrot = 213
		end
		if (i == p_energy_max-1+.5) then
			if (p_energy_max%1 ==.5) then
				carrot = 198
				if (p_energy-p_energy_max==0) then
					carrot = 197
				end
			else
				return
			end
		end
			spr(carrot,playerx-63+i*8,playery+55)
	end


--if (hp_to_px <= 0) hp_to_px = 0
--rectfill(barx-1,playery+54, max(barx + playerhp_max/5 + 1,  barx + hp_to_px + 1),playery+56, 1)
--if (playerhp > 1 ) then
--	if (playerhp < 15) barc = 8
--	rectfill(barx,playery+55, barx + hp_to_px ,playery+55, barc)
--	if (playerhp>playerhp_max) then 
--		playerhp=playerhp_max
--	end
--end

--local mp_color = 9
--if (w_arcane and player_focus < 30) mp_color = 12
--rectfill(barx-1,playery+58, barx + p_energy_max/5 + 1 ,playery+60, 1)
--rectfill(barx,playery+59, barx + flr(p_energy /5),playery+59, mp_color)
--pset(playerx-57 + flr(carrot_energy / 5),playery+59,10)

	local exp_to_exp = flr(112/(max_exp/exp))
	rectfill(playerx-57,playery-61, playerx+57,playery-59, 1)
	rect(playerx-56,playery-60, playerx-56+exp_to_exp,playery-60, 14)
   	if (show_lvlup and not game_over) then
   		print("level up",playerx-14,playery-63,7)
   	else
   		print("LVL"..level,playerx+44,playery-63,7)
   	end
end
