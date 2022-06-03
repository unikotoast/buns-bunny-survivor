energy_cd = 0
p_energy_timer = 20
p_energy_timer_max = 40

p_energy_regen = 1

regen_focus = 0

function cooldown_update()
    if (energy_cd > 0) energy_cd -= 1

      if (w_arcane and player_focus < 30) then
        regen_focus = 1.5
      else
        regen_focus = 0
      end

    if (energy_cd == 0 and p_energy < p_energy_max)  then
      p_energy_timer -= 1

    if (p_energy_timer == 0) then
      p_energy_timer= p_energy_timer_max
      p_energy += .5
    end
end




  if (w_carrot_cd > 0) then
    w_carrot_cd -= 1
  end

end

function draw_bullets()
  for b in all(bullet_carrots) do
   spr(b.sprite, b.x,b.y, 1, 1, b.is_flipx, b.is_flipy)
  end
end


function deal_damage(enemy, dmg)
  enemy.hp -=dmg
  if (enemy.hp <= 0) then
    kill_enemy(enemy)
  else
      enemy.damaged = 3
  end
end
