level = 0
exp = 0
exp_total = 0
max_exp = 3
draw_lvlup_txt = false

gems = {}

function make_gem(x,y)
    local gem = {sprite=32,x=x,y=y,picked=false,anim = 90,time = 8000, frame = 0, speed=2,dx=0, dy=0, }
    add(gems,gem)
end

function draw_gems()
    for gem in all(gems) do
        gem.anim -= 1
        gem.time -= 1
        if (gem.anim < 10) then
            gem.frame += 1
        end
        if (gem.frame > 4) then
            gem.frame = 0
            gem.anim = 90
        end
        spr(gem.sprite + gem.frame, gem.x,gem.y + sin(t()%2))
        if (gem.time < 0 ) del(gems,gem)
    end
end

function get_exp()
    exp_total += 1
    sfx(8)
    if (p_energy_max <= 0) exp += 5
    exp +=1
    if (exp >= max_exp) then
        level_up()
    end
end

function move_gems()
    for gem in all(gems) do
        if (gem.picked) then
            local p = angle_move(gem.x, gem.y, playerx, playery, gem.speed)
          gem.x+=p.x
          gem.y+=p.y
        end
    end
end


function level_up()
    sfx(16)
    if (show_lvlup) return
    level += 1
    if (level == 1) then
        max_exp = 7
    else
        max_exp = min(max_exp*1.2,90)
    end
    exp = 0
    if (p_energy < p_energy_max) p_energy = p_energy_max
    dash_cooldown = dash_cooldown_max

   -- add_timed_anim(251,playerx-47+(playerhp_max-2)*8,playery+48,3,30)

   --     for i=1,30 do
   --             add_particle(playerx-58+(playerhp_max-2)*8+rnd(12),playery+54 +rnd(12), rnd({14,15}), i*3)
   --     end

    lvlup_txt = 148
    lvlup_speed = 10
    lvlup_speed_reverse = false
    setup_random_weapons(level % 5 == 0 or level == 1)
    choose_window_t = 30
    choose_window_pause_t = 80
    show_lvlup =true
    beam_animation= .1
end