function decrease_max_carrots()
	p_energy_max -=.5
	if (p_energy_max < 0) p_energy_max = 0
end

w_fire_d = {sprite=89, 
		name="fIRE dASH", info="dash damages enemies", use =  function() 
		hair_color = 8
		fire_dash = true
		del(ws, w_frost_d) 
		del(ws, w_fire_d) 
		end}

w_frost_d = {sprite=90, 
		name="fROSTY dASH", info="dash freezes enemies", use =  function(self) 
		hair_color = 12
		frosty_dash = true
		del(ws, w_fire_d) 
		del(ws, w_frost_d) 
		end}

w_reroll = {sprite=108, 
		name="rEROLL", info="", reroll = true}

ws = {

	{sprite = 52, name = "cARROT bURGER \f8-15% speed", info = "+1 ♥", use = function() 
		playeracc -= .006
		playerhp_max +=1 end},

	{sprite = 74, name = "dAMAGE", info = "up damage", use = function () 
		w_damage +=1 end},

	{sprite = 76, name = "cARROT pARFAIT \f8-15% speed", info = "+1 carrot", use = function () 
		playeracc -= .006
		p_energy_max +=1 end},

	{sprite = 73, name = "cARROT cAKE \f8-30% speed", info = "full heal +1 carrot +1 ♥", use = function () 
		playeracc -= .012
		playerhp_max +=1
		p_energy_max +=1
		playerhp = playerhp_max end},

	{sprite = 77, name = "hASTE", info = "up attack and move speed", use = function (self) 
		w_carrot_cd_max -= 6
		if (w_attack_speed == 5) del(ws, self)
		playeracc += .003
		w_attack_speed +=1 end},

	{sprite = 78, name = "sWIFTNESS LVL", info = "faster movement and dash", use = function (self) 
		w_move_speed += 1
		dash_cooldown_max -= 20
		if (w_move_speed == 4) del(ws, self)
		playeracc += .007 end},

--{sprite=127, 
--		name="pEACH oVERLOAD", info="create peaches", use =  function(self) 
--		for i=0,3 do
--					local p = random_outside_point(i/4,50)
--					make_peach(p.x,p.y)
--				end
--
--		 end},

{sprite=79, 
		name="pIERCING sHOT \f9-0.5 carrot", info="carrots go through enemies ", use =  function() 
		decrease_max_carrots()
		drill_lvl+=1
		--if (drill_lvl == 1) carrot_energy += 2
	--	carrot_energy +=2
		 end},

{sprite=66, 
		name="cROSSFIRE \f9-0.5 carrot", info="shoot more carrots", use =  function(self) 
		decrease_max_carrots()
		--carrot_energy +=2
		split_shot += 1 
		if (split_shot == 5) del(ws, self)
		end},

--{sprite=93, 
--		name="cROSSFIRE \f2-0.5 carrot", info="chance to shoot 4 carrots ", use =  function(self) 
--		carrot_crossfire += 1
--		decrease_max_carrots()
--	--	carrot_energy +=3
--		if (carrot_crossfire == 3) del(ws, self) 
--		end},

{sprite=92, 
		name="sHURIKENS \f9 -20% attack speed", info="throw shurikens ", use =  function() 
		w_carrot_cd_max += 10
	--	carrot_energy +=4
		w_shuriken += 1
		end},


{sprite=91, 
		name="aTTRACTOR", info="pick up range, more bunnies", use =  function() 
			magnet_area+=8
			for i=0,30 do
				bunny(timer+i*45+rnd(30))
			end
			end},

--{sprite=126, 
--		name="aRCANE fOCUS", info="+200% mp regen while standing", use =  function(self) 
--		del(ws, self)
--		w_arcane = true
--	end},

{sprite=219, 
		name="sPLASH \f9 -30% attack speed", info="carrots do splash damage ", use =  function(self) 
		--decrease_max_carrots()
		carrot_splash += 1
		w_carrot_cd_max += 15
		if (carrot_splash == 4) del(ws, self) 
		end},
{sprite=60, 
		name="tHUNDER cLOUD \f8-15% speed", info="summon lightning ", use =  function(self) 
		playeracc -= .006
		if (w_lightning == 0) setup_cloud()
		w_lightning+=1
		end},

{sprite=121, 
		name="rING oF fLAME \f8-20% speed", info="damage nearby enemies ", use =  function()  
		playeracc -= .009
		ring_of_fire += 1
		end},


--{sprite=84, 
--		name="rING oF gREED", info="+30% mp regen \f2-15 hp", use =  function() 
--		p_energy_regen += .14
--		playerhp_max -=15
--		end}
--
--}
{sprite=93, 
		name="gOLDEN cARROT \f2-20% speed", info="+75% carrot regen", use =  function(self) 
		p_energy_timer_max -= 20
		playeracc -= .009
		del(ws, self) 
		end},

w_fire_d,

w_frost_d

}