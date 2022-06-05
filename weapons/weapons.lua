
function decrease_max_hp()
	playerhp_max -= 1
	if (playerhp > playerhp_max) playerhp = playerhp_max
	if (playerhp <= 0) game_lost()
end

function decrease_max_carrots()
	p_energy_max -=.5
end

ws = {

	{sprite = 52, name = "cARROT bURGER \f2-15% speed", info = "+1 heart", use = function() 
		playeracc -= .006
		playerhp_max +=1 end},

	{sprite = 74, name = "dAMAGE", info = "up damage", use = function () 
		w_damage +=1 end},

	{sprite = 76, name = "cARROT pARFAIT \f2-15% speed", info = "+1 carrot", use = function () 
		playeracc -= .006
		p_energy_max +=1 end},

	{sprite = 73, name = "cARROT cAKE \f2-35% speed", info = "full heal +1 carrot +1 heart", use = function () 
		playeracc -= .016
		playerhp_max +=1
		p_energy_max +=1
		playerhp = playerhp_max end},

	{sprite = 77, name = "hASTE", info = "up attack speed", use = function (self) 
		if (w_attack_speed == 5) del(ws, self)
		w_attack_speed +=1 end},

	{sprite = 78, name = "sWIFTNESS LVL", info = "faster movement", use = function (self) 
		w_move_speed += 1
		if (w_move_speed == 4) del(ws, self)
		playeracc += .008 end},

--{sprite=127, 
--		name="pEACH oVERLOAD", info="create peaches", use =  function(self) 
--		for i=0,3 do
--					local p = random_outside_point(i/4,50)
--					make_peach(p.x,p.y)
--				end
--
--		 end},

{sprite=79, 
		name="pIERCING sHOT \f2-0.5 carrot", info="carrots go through enemies ", use =  function() 
		decrease_max_carrots()
		drill_lvl+=1
		--if (drill_lvl == 1) carrot_energy += 2
	--	carrot_energy +=2
		 end},

{sprite=66, 
		name="sPLIT aTTACK \f2-0.5 carrot", info="shoot 1 carrot behind ", use =  function(self) 
		decrease_max_carrots()
		--carrot_energy +=2

		del(ws, self)
		back_shot = true end},

{sprite=89, 
		name="dOUBLE sHOT \f2-0.5 carrot", info="shoot 2 carrots ", use =  function(self) 
		decrease_max_carrots()
	--	carrot_energy +=3
		del(ws, self)
		bullet_double =true 
		end},

{sprite=93, 
		name="cROSSFIRE \f2-0.5 carrot", info="every 5th shot ", use =  function(self) 
		bullet_explosion += 1
		decrease_max_carrots()
	--	carrot_energy +=3
		if (bullet_explosion == 3) del(ws, self) 
		end},

{sprite=92, 
		name="sHURIKENS \f2-0.5 carrot", info="throw shurikens ", use =  function() 
		decrease_max_carrots()
	--	carrot_energy +=4
		w_shuriken += 1
		end},


{sprite=91, 
		name="aTTRACTOR", info="increase pick up range", use =  function() magnet_area+=8 end},

--{sprite=126, 
--		name="aRCANE fOCUS", info="+200% mp regen while standing", use =  function(self) 
--		del(ws, self)
--		w_arcane = true
--	end},

{sprite=219, 
		name="eXPLOSIVE cARROTS \f2-0.5 carrot", info="carrots do splash damage ", use =  function(self) 
		decrease_max_carrots()
		carrot_splash += 1
		if (carrot_splash == 4) del(ws, self) 
		end},
{sprite=60, 
		name="tHUNDER cLOUD \f2-1 heart", info="summon lightning ", use =  function(self) 
		decrease_max_hp()
		if (w_lightning == 0) setup_cloud()
		w_lightning+=1
		if (w_lightning == 6) del(ws, self) 
		end},

{sprite=121, 
		name="fLAME cOAT \f2-1 heart", info="damage nearby enemies ", use =  function() 
		ring_of_fire += 1
		decrease_max_hp()
		end},


--{sprite=84, 
--		name="rING oF gREED", info="+30% mp regen \f2-15 hp", use =  function() 
--		p_energy_regen += .14
--		playerhp_max -=15
--		end}
--
--}
{sprite=202, 
		name="mAGIC wATERING \f2-15% speed", info="+30% mp regen", use =  function() 
		p_energy_timer_max -= 7
		playeracc -= .006
		end}

}