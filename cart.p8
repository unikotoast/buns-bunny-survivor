pico-8 cartridge // http://www.pico-8.com
version 36
__lua__
#include main.lua
#include collisions.lua
#include exp/experience.lua
#include util.lua
--#include weapons/weapons_main.lua
#include weapons/weapons.lua
#include weapons/weapon_update.lua
#include ui.lua
--#include weapons/attacks/fire_wand.lua
--#include weapons/attacks/beam.lua
#include weapons/attacks/carrots.lua
--#include weapons/attacks/sword.lua
#include weapons/attacks/lightning.lua
#include weapons/attacks/ring_of_fire.lua
--#include weapons/attacks/cat.lua
#include player.lua
#include lose.lua
#include player_move.lua
#include enemies/enemy_spawn.lua
#include enemies/enemy_update.lua
#include enemies/monsters.lua
#include enemies/monsters2.lua
#include enemies/enemy_waves.lua
#include enemies/enemy_bullets.lua
#include items/magnet.lua
#include items/items_main.lua
#include animations.lua
#include start.lua
#include map.lua
--#include collissions_spatial_hash.lua


__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000011111111111111110777770007777700077777000000000000000000
0b000b00000000000000000000000000000700000000000000070000000000000000000000111100111111117777766077777660777776600000000000000000
00b00b0b00000000000000000000b0000079700000000000007a7000000000000000000020011002100110017117116071171160722722600000000000000000
b1b01b1b0000000000000000000b000000b7b0000000c000000700000000000000b0000012000021020000207117116078878860788788600000000000000000
0000000000aaa000700000000000b00000000000b0b00b00001b000000b0b000090b000011080811210808127771776077717760777877600000000000000000
00000000000a00000b00a00000b1b00b000000001b001b0000000000000b0000000b000011000111110001117766666077666660776666600000000000000000
00000000001b00000b000b0000000000000000000000000000000000001b0000001b000011111111111111110616160006161600068686000000000000000000
00000000000000001b0b1b0b00000000000000000000000000000000000000000000000011111111111111110000000000000000000000000000000000000000
0000000000000000000000000000000000eeeee000eeeee000eeeee000eeeee0000000000077700d00000000000590000677700007777000000c00c000c00c00
000000000000000000000000000000000000000000eeeeee00eeeeee00000000000000000717100d0077700d0019a9000d6777700077777000ccc0cc00cc0cc0
000000000000000000000000000000000eeeeeee0eeeeeee0eeeeeee0eeeeeee0eeeeeee677770d06717100d0114941000d667770000007700c1cc1c0c1cc1cc
0000000000000000000000000000000000000000eeeeeeeeeeeeeeee0000000000000000606067d0677770d001d14110000d6677000000070c11111c0c11111c
00000000000000000000000000000000ee0eeee0ee0eee00ee0eee00ee0eee00ee0eee0000600000006067d001111d10000dd677000000070c17117c0c17117c
0000000000000000000000000111111000000000e0eeeee0e0eeeee0000000000000000007776000677700000111d11000dd67770000000700c1111c00c1111c
00000000000000000000000011111111000eee00000eee00000eee00000eee00000eee0060000700700060000f1111f00dd6777000000070000cccc0000cccc0
0000000000000000000000000111111000000e0000000e0000000e0000000e00000000007000000000007000000000f0dd677000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000007a0000090090000000000000077770000777700000c0c000000000c
0000000000000000000000000000000000000000000660000000000000066000000000000009100000a00000000a5000077777700770007000cccc0c000c0c05
0008700000077000000e7000000e7000000e700007767600000660000776760000066000001d110000a9100000a7a10007766770070000000067670500cccc01
0088e70000ee770000e77700007e770000ee77007667665007767600766766100776760001d1111001d11110014a41107766d677770000000116660100676715
002288000088e70000887e000087ee000088ee006666d6657667665066661661766766c0011111101d11111101d41110776ddd67770000006011111501166605
000280000008e0000008e000000870000008e000dd6d66d56666d665116166616666c66c001111001111111101111d1076d00dd6770000000011110560111105
00000000000000000000000000000000000000000ddddd50dd6d66d501111610cc6c666c00f11f0001f11f100d11d1106d0000dd700000000111d1050111d105
0000000000000000000000000000000000000000000000000ddddd50000000000cccc6c000f0000000000f000d1111d00000000d00000000111dd105111dd100
00000000000000000000000000e000000000000000700000000990000777c0000070000c70000c00770000000007000000067600000000000000000000000000
0000000000000000000e0000000000000f7ff7f00000700000999900000c7700c070000c7000077c077c0000007c00c000676650000000000000000000000000
000870000000000000000000e0000e00ffffffffc00007c0009aa9000c0007c000c700c00770700077c00000c0777c000666c665008008000080000000000000
0088e700000000000e07e00000000000777777770cc0007c099aa990000007c0000c707000777c007c00000000c007c00c6c666c087002200870002000000000
0022880000000000000e700000e0000088bb999b07c0000009aaaa9000000c700000c700000700000777c0000000007005c776c5272008822700008208000000
000280000000000000e00e0000000000044499470070000099a77a990c77c770c000c070007c000000c0777000c770c70000c700222008822220008227000002
0000000000000000000000000e0000e0ffff97ff000000709aa77aa9c70c77000007c00000c7700000007c000c70077000007c70882022228820002222000002
000000000000000000000000000000000f7ffff0000000000a7777a07c000000007000070000c7c0000c700000c00000000c70000ff0fff00f0000f08800f002
00000000000000000000000000000000000000000006da7700000000020000000100000100000000080080800eeee00000000b00a00a00000000000000000000
00000000000000000000099000000000000b0b00000daa770200000000100001011000800bb0bb0000888880e799ee00000099b00a99a990000000000a00b0b0
00000000000000000000bb40b0000000009bb000006dadaa012000100011080000000000bb7bbbb08887777879999e6000e7940099a77a99eeeff7000009bb00
000000000000000000000b000b9799400049bb0000deeaad001180000000000000000000b7bbbbb00877e7e7e9a5a500077e7770a7797979000667000a049bb0
000000000000000000b00000bb7999990499900000d82ddd0001112010001000000000003bbbbb3008777777eeaa5500067666509a7777770eee66770a999900
000000000000000009bb00000b949440099000000551dd0000110000000010121000000003bbb300887e7ee702e225600066650097979977000666670a990000
000000000000000009400000b000000000000000d5100000010001000001000000001002003b300000877ee7000002560006500099779977eeee555509aaa0a0
00000000000000000000000000000000001100005100000000000000010000100001000000030000080877770000002500666500099777770000000000000000
00770077077007700000000000000000000000000000000000000000000000000000000000099000990000007200002700000700990090990000000000000000
0077007707770777007700770000000000000000000000000000000000000000000000000b994000499b0000280cc0820000566743b90b340000000000000000
007feef7007feef70077707770000000000000000000000000077770000000000000000000b4000004b0000000c00c00005076600b0000b00000000000000000
00eeeeee000eeeeee007feef7000000000000000000000000007171000000000070000000b0b00000b0900000c0000c05000507000000009007cc00000000000
0eeeefee00eeeefee0eeeeeeee000000000000000000000000077770000777700000000000000099000090000c0000c0000500000900000007d1dc0007cccc00
0eef1f1e0eeef1f1eeeeeeefee00000000000000000000006000d00600071710000077700000b9940000090000c00c00000005000b0000b00c111c0071d1d1c0
0eeffffeeeeeffffeeeeef1f1e000000000000000000000000006600700777770d01071000000b4000009000280cc0820500000093b09b3900ccc0000ccccc00
0ee22200eeee2220000eeffff000000000000000000000000060000007007000700000d00000b0b0000900007200002700000500940900490000000000000000
0ef1e1f0000f1e1f0000f2e100000000000000490000900000000000000000000000000000070000900000070000070700000000067770000000000049000099
00e111000000211000000112f000000000009494000494000000000000000000000700000000000009700a700000e777000000000d6777700000000093b00b34
000202000000002000000200000000000004999000099400b00000000009900000000000700000000097a700000e07770000000000d66777000000000b0000b0
0077007707700770000000000000000000999940000499000b499440009779000000070000000000000a700000e0ee0e00000000000d66770000000000000000
00770077077707770077007700000000bbb9440000099400bb99999900977900007000000000007000a7a7000e0ee0e000000000000dd6770000000000000000
007f77f7007f77f7007770777000000000bb9000000499000b9494400009900000000000000000000aa80a7000ee0e000000000000dd6777000000000b0000b0
00777777000777777007f77f700000000b0b0000000bbb00b0000000000000000000000000000000a00000a90e00e000000000000dd677700000000093b00b39
07777f77007777f77077777777000000000b000000b0b0b00000000000000000000000000000a0000000000ae00e000000000000dd6770000000000094000094
077f1f170777f1f17777777f7700000000000000000000000000000000000000000000000009000a0770077000000707000bb0bb000000000000000000000bb0
077ffff77777ffff77777f1f1700000000000000500020200000000000000000000000000900a09a1cc01880000ee7770000bbb3000000000caaa9900bb0e200
077222007777222000077ffff00000000000000050005550000000000000000000000000a00a90a91cc018800000077700093b3000070000ca000099e2002200
07f171f0000f171f000002710000000000000000050015100000000000000000000000009a7aa70a1cc0188000ee0ee00074933300066700c009900922000000
00e11100000021100000f112f000000000000000050055500000000000000000000000000a0000a01ccc8880000000000799990300766000c0090099000000bb
000202000000002000000200000000000000000000551a100000000000000000000000007090090701cc88007e7ee0000999400000007000cc09999000bb0e20
007707700077000770000000000000000000000000555d5000000000000000000000000007a90a70001110007770000049440000000000000cc0000c0e200220
00770770007770777007700077000000000000000020202000000000000000000000000000977a000000000077700000940000000000000000ccccc002200000
007f7f700007f7f70007770777000000000000000080000800080008000800000000000000000000000000100000000000100000000000000000000007600000
007777700007777700077f7f77000000000000000880088000800080000000000001000000000001000000110000000001100000000000000000000076607600
0077f77000077f770000777770000000000020208000880080000800800000000011000000000001100001111000000011110000000799000007990016176670
0771f17700771f17700077f770000000000055500008800800080008000800000011100000000011100011121100000112111000009979900099799051c66766
077fff770077fff7700771f177000000000015100080008000000080000000000011100008000012110011222110001122211000007999700079997066156666
077222770077222770077fff770000000000555008000800080008000800000001111100888001121100112221118111222110000002f2000002f20016ccc6d1
07f171f7007f171770077272f700000005551a10800080008000000080000000011121108f801112110012211118881111221000000fff00000fff000155ccd1
007111700007211f0000f1127000000055252d20000800000008000000080000012121118f811122110012212218f8122122100000000f00000f000000111110
0002020000000020000002000000000000000000000c00c000c00c00000000000121211ff2ff1221110012112218f81221121000008228000082280007600000
007700770770077000000000000000005000202000ccc0cc00cc0cc0000000000121121f222f22112100100221ff2ff122001000087222200872222076607600
007700770777077700770077000000005000555000c1cc1c0c1cc1cc00000000012211f02f20f1122100000001f222f100000000272228822722288226276670
007fe7f7007feef70077707770000000050085800c11111c0c11111c0000000001221000fff00022210000000f02f20f00000000222228822222288252866766
00eee777000eeee77007feef70000000050055500c17117c0c17117c00000000012200002f20000221000000000fff0000000000882222228822222266256666
0eeeef7700eeeef770eeeeee7700000000551a1000c1111c00c1111c0000000001220000f2f00002210000000002f200000000000f1ff1f00f1ff1f02688866d
0eef1f170eeef1f17eeeeeef7700000000555d50000cccc0000cccc00000000001000000f0f0000001000000000f2f00000000000ffffff00ffffff0015588d1
0eeffff7eeeeffff7eeeef1f17000000002020200000000000000000000000000100000f0f00000001000000000f0f00000000000ff0000000000ff000111110
0ee22200eeee2220000eeffff00000000000000011111111111111110000000000000000000000000000000000f0f00000000000000000000700000000000000
0ef171f0000f171f0000027100000000000000000011110011111111000000000000000000000000000000000000000000000000007000700070007770000007
00e11100000021100000f112f0000000000008002001100210011001000000000000000000000000000000000000000000000000000707000000000000000007
00020200000000200000020000000000000880001200002102000020000000000000000000000000000000000000000000000000007700000000000000000000
00770077077000077000000000000000000880001108081121080812000000000000000000000000000000000000000000000000007770007007000000000000
00770077077700777077000077000000008000001100011111000111000000000000000000000000000000000000000000000000000770700007700070000000
0077ee770077ee770077700777000000000000001111111111111111000000000000000000000000000000000000000000000000070007000700000700077000
00eeeeee00eeeeee0007eeee70000000000000001111111111111111000000000000000000000000000000000000000000000000000000007000070007000007
00eeeeee0eeeeeeee00eeeeee0000000000000000000000000000000000000000000000007c00000000000000008800000000000076000000777770007777700
00eeeeee0eeeeeeee0eeeeeeee000000000d700000cccc0000000000007ccc00007cc0007c000000000000000007770000088000766076007777766077777660
00eeeeee0eeeeeeee0eeeeeeee00000000dd77000c77ccc00000000007ccc00007c00000c0000000000000000771710007777700161766707117116072272260
00eeeeee00eeeeee00eeeeeeee0000000dddd770ccd7cdcc0c77ccc0cc1c00cccc00000c0000000000000000777797007771710051c667667887886078878860
00eeeeee000eeee0000eeeeee00000000555ddd0c1d11d1cccd7cdcccc1001ccc00000cc00000000000000007777870077779700661566667771776077787760
000eeee0000021100000eeee000000000055dd00c111111cc1d11d1ccc00ccccc0000ccc0000000c00000000777770007777800016ccc6d17766666077666660
000202000000002000000200000000000005d000cc1111cccc1111cc000cccc00000ccc0000000cc0000000009770000077900000155ccd10616160006161600
00770077077000077000000000000000000000000cccccc00cccccc0000000000000000000000cc0000000000009000009000000001111100000000000000000
007700770777007770770000770000000000bb0000000000000000000000cc00000c0c00000c0c00000000000000007700000000000000000000077007700000
00777777007777770077700777000000004bbb0000000000000000000c000000000000000000000000000000007707770000007700000000eee0077e077ee0ee
007777770077777700077777700000000224e20000dbdb0000dbdb0000000000c0000000c000000c90000440007e07e00077077700000000eeeee7feef7eeeee
007777770777777770077777700000002e2e7e200d9b35000d1b3500c000000cc000000c000000009900400400777770007e07e000000000eeeeeeeeeeeeeeee
007777770777777770777777770000002e2ee7200d99bb000d11bb000000000000000000c000000cc4909999ff77171700777770000000000eeeeeeefeeeeee0
007777770777777770777777770000002ee2ee200d5445000d511500c000000c0000000c0000000000499799ff7f777fff771717000000000eeeeef7f7eee000
0077777700777777007777777700000002eee2000055500000555000000000000c000000000000c0c0049799f7777867f77f786f0000000000eef0ffff0f0000
0077777700077770000777777000000000222000000000000000000000c0c000000c0c0000cc0000000044440777728007777280000000000000012221000000
00077770000021100000777700000000000000000000000000000000000000000000000000000000000000000800800800000000000000000000001e10000000
0002020000000020000002000000000000000000000000000000000000000000000000000000000000000000000afa0000000000000000000000001110000000
0077077000770007700000000000000000dbdb0000dbdb0000dbdb000770770007707700077077000000000000af99a000000000000000000000002020000000
007707700077707770077000770000000d9b35000d9b35000d2135007ee7ee607ee71160711711600000000008f994f800000000000000000000000000000000
007fef700007fef700077707770000000d99bb000d99bb000d211b006e828e606e811160611111600000000000bb4fa000000000000000000000000000000000
00eeeee0000eeeee00077fef77000000d9944500d2144500d211150006222600062116000611160000000000000bfa0000000000000000000000000000000000
00eefee0000eefee0000eeeee0000000d9455000d1155000d115500000d2d00000d1d00000d1d000000000000800800800000000000000000000000000000000
0ee1f1ee00ee1f1ee000eefee0000000555000005550000055500000000d0000000d0000000d0000000000000000000000000000000000000000000000000000
0eefffee00eefffee00ee1f1ee00000007700770000000000000000000888800000000000000000000000000880000cc00070007000000009000000700000070
0ee222ee00ee222ee00eefffee0000001cc018800aa00aa000000000080000800088880000000000000000008000000c0e700e700000000009700a7000700700
0ef1e1fe00ef1e1ee00ee2e2fe0000001cc018801cc01880000000008000000808000080000000000000000000800c00e70007000000a0000097a70090000000
00e111e0000e211f0000f112e00000001cc018801cc018800000000080077008080770800000000000000000000ee000000e7000000a7a00000a700000000000
000202000000002000000200000000001ccc88801cc018800000000080077008080770800000000000000000000ee00000e7e7000000a00000a7a70000000070
0077007707700007700000000000000001cc88001ccc8880000000008000000808000080000000000000000000c008000ee20e70000000000aa80a70000000a9
007700770777007770770000770000000011100001cc88000000000008000080008888000000000000000000c0000008e00000e200000000a00000a90a000000
0077777700777777007770077700000000000000001110000000000000888800000000000000000000000000cc0000880000000e000000000000000aa0000000
0077777700777777000777777000000007776600000000000800080000cccc000000000000000000000000000000000000000000000000000008700000000000
007777770e777777e0077777700000007887886008808800080008000c0000c000cccc0000000000000000000000000000000000000000000088770000087000
00e7777e0ee7777ee0e777777e000000788788600880880008000800c000000c0c0000c000000000000000000000000000000000000000000881817000887700
00eeeeee0eeeeeeee0ee7777ee000000088788000880880008000800c007700c0c0770c000000000000000000000000000000000000000000222888008888770
00eeeeee00eeeeee00eeeeeeee000000777877600888880008000800c007700c0c0770c000000000000000000000000000000000000000000022880002218180
00eeeeee000eeee0000eeeeee0000000000000000880880008000800c000000c0c0000c000000000000000000000000000000000000000000002800000228800
000eeee0000021100000eeee000000000616160008808800080008000c0000c000cccc0000000000000000000000000000000000000000000000000000028000
0002020000000020000002000000000000000000000000000800080000cccc000000000000000000000000000000000000000000000000000001100000111100
__label__
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333aaa333333333333333333333333333
33333333333333333333333333330000000000000333333333333333333333333333333333333333333333300000000000003333333333333333333333333333
33333333333333333333333300000000000000000000033333333333333333333333333333333333330000000000000000000000033333333333333333333333
33333333333333333333330000000000000000000000000333333333333333333333333333333330000000000000000000000000000033333333333333333333
33333333333333333333000000000000000000000000000003333333333333333333333333330000000000000000000000000000000000033333333333333333
33333333333333333300000000000000000000000000000000003333333333333333333330000000000000000000000000000000000000003333333333333333
33333333333333333000000000000000000000000000000000000003333333333333330000000000000000000000000000000000000000000033333333333333
33333333333333330000000000000000000000000000000000000000033333333330000000000000000000000000000000000000000000000000333333333333
33333333333333300000000000000000000000000000000000000000000000330000000000000000000000000000000000000000000000000000033333333333
33333333333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003333333333
33333333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000333333333
333333333333000000000000000000000000000000000000000000cccccc00cc00cc00cccc000000cccc00000000000000000000000000000000000033333333
3333333333330000000000000000000000000000000000000000e777777ce77ce77ce7777c0000e7777c00000000000000000000000000000000000033333333
3b333b3333300000000000000000000000000000000000000000e777777ce77ce77ce77770cc00e7777000000000000000000000000000000000000003333333
33b33b3b33300000000000000000000000000000000000000000e77ce77ce77ce77ce77ce77ce77c000000000000000000000000000000000000000003333333
b1b31b1b33300000000000000000000000000000000000000000e77ce770e77ce77ce77ce77ce77ccccc00000000000000000000000000000000000000333333
3333333333000000000000000000000000000000000000000000e7777c00e77ce77ce77ce77ce777777c00000000000000000000000000000000000000333333
3333333333000000000000000000000000000000000000000000e77770cce77ce77ce77ce77ce777777c00000000000000000000000000000000000000033333
3333333333000000000000000000000000000000000000000000e77ce77ce77ce77ce77ce77c0000e77c00000000000000000000000000000000000000033333
3333333333000000000000000000000000000000000000000000e77ce77ce770e77ce77ce77c00cce77000000000000000000000000000000000000000033333
3333333333000000000000000000000000000000000000000000e777777c00e7777ce77ce77ce7777c0000000000000000000000000000000000000000033333
3333333333000000000000000000000000000000000000000000e777777000e77770e770e770e777700000000000000000000000000000000000000000033333
33333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000033333
33333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000033333
3333333333000000000000000000eee0e0e0ee00ee00e0e000000ee0e0e0eee0e0e0eee0e0e00ee0eee00000eee00000eee00000000000000000000000033333
3333333333300000000000000000e0e0e0e0e0e0e0e0e0e00000e000e0e0e0e0e0e00e00e0e0e0e0e0e00000e0e0000000e00000000000000000000000333333
3333333333300000000000000000ee00e0e0e0e0e0e0eee00000eee0e0e0ee00e0e00e00e0e0e0e0ee000000e0e0000000e00000000000000000000000333333
3333333333330000000000000000e0e0e0e0e0e0e0e000e0000000e0e0e0e0e0eee00e00eee0e0e0e0e00000e0e0000000e00000000000000000000003333333
3333333333330000000000000000eee00ee0e0e0e0e0eee00000ee000ee0e0e00e00eee00e00ee00e0e00000eee00e0000e00000000000000000000033333333
33333333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000033333333
33333333333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000333333333
33333333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003333333333
33333333333333330000000000000000000000000000000000000000000003333000000000000000000000000000000000000000000000000000333333333333
33333333333333333000000000000000000000000000000000000000003333333333300000000000000000000000000000000000000000000003333333333333
33333333333333333300000000000000000000000000000000000003333333333333333000000000000000000000000000000000000000000333333333333333
33333333333333333333000000000000000000000000000000333333333333333333333333300000000000000000000000000000000000033333333333333333
33333333333333333333330000000000000000000000000333333333333333333333333333333000000000000000000000000000000003333333333333333333
33333333333333333333333330000000000000000000333333333333333333333333333333333333300000000000000000000000003333333333333333333333
33333333333333333333333333333000000000003333333333333333333333333333333333333333333333000000000000000333333333333333333333333333
33333333333333333333333333333333333333333333c33333333333333333333333333333333333333333333333333333333333333333333333333333333333
3333333333333333333333333333333333333333b3b33b3333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333331b331b3333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
3333333333333333333333333333b333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333333333333333333333333333b3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
3333333333333333333333333333b333333333333333333333333333333333333333333333333333333333333333333333333333733333333333333333aaa333
33333333333333333333333333b1b33b3333333333333333333333333333333333333333333333333333333333333333333333333b33a33333333333333a3333
333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333b333b3333333333331b3333
333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333331b3b1b3b3333333333333333
33333333333333333333333333333333333333333333333333333333333333333377377333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333377377333333333333333333333333333333333333333333333333333333333
3333333333333333333333333333333333333333333333333333333333333333337fef733333333333333333333333333333333333333eeeee33333333333333
333333333333333333333333333333333333333333333333333333333333333333eeeee3333333333333333333333333333333333333eee3eee3333333333333
3333333333333333333333333333333333333333333333333333333333333333eeeefee3333333333333333333333333333333333333ee333ee3333333333333
333333333333333333333333333333333333333333333333333333333333333eeee1f1ee333333333333333333333333333333333333ee333ee3333333333333
333eeeee333333e3e3333337737373377337737773333333333333333333333eeeefffee3333333333333333333333333333333333333eeeee33333333333333
33ee3e3ee33333e3e3333373337373737373733733333333333333333333333eeee222ee33333333333333333333333333333333333333333333333333333333
33eee3eee333333e333333777377737373737337333333333333333333333333eef1e1fe33333333333333333333333333333eeeee333eeeee333eeeee333333
33ee3e3ee33333e3eb333b33737373737373733733333333333333333333333333e111e33333333333333333333333333333eee33ee3ee333ee3ee33eee33333
333eeeee333333e3e3b33b773373737733773337333333333333333333333333333232333333333333333333333333333333ee333ee3ee333ee3ee333ee33333
3333333333333333b1b31b1b3333333333333333333333333333333333333333333333333333333333333333333333333333eee33ee3eee3eee3ee33eee33333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333eeeee333eeeee333eeeee333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333eeeee333333eee333337733777337737373333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33ee333ee3333333e333337373737373337373333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33ee3e3ee333333e3333337373777377737773333333333333333333333333333333333333333333333333333333333333333333777337737373777333333333
33ee333ee33333e33333337373737333737373333333333333333333333333333333333333333333333333333333333333333333777373737373733333333333
333eeeee333333eee333337773737377337373333333b33333333333333333333333333333333333333333333333333333333333737373737373773333333333
3333333333333333333333333333333333333333333b333333333333333333333333333333333333333333333333333333333333737373737773733333333333
33333333333333333333333333333333333333333333b3333333333333aaa3333333333333333333333333333333333333333333737377333733777333333333
333333333333333333333333333333333333333333b1b33b33333333333a33333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333331b33333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333333333333333333333333333333333333333333333333333333333333333333b3b3333333333333b3b3333333333333333333333333333333333333333333
3333333333333333333333333333333333333333333333333333333333333333333b333333333333333b33333333333333333333333333333333333333333333
3333333333333333333333333333333333333333333333333333333333333333331b333333333333331b33333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
3333333333333333333333333333333333333333333333333333333333333333377777333333b333333333333333333333333333333333333333333333333333
333333333333333333333333333333333333333333333333333333333333333377777663333b3333333333333333333333333333333333333333333333333333
3333333333333333333333333333333333aaa333333333333333333333333333711711633333b333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333a33333333333333333333333333337117116333b1b33b333333333333333333333333333333333333333333333333
33333333333333333333333333333333331b33333333333333333333333333337771776333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333337766666333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333616163333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333366666666666666666666633333333333333333333333333333333333333333333333333
333333333333333333b3b33333333333333333333333333333333333366006000600060006000633333333333333333333333333333333333333333333333333
3333333333333333333b333333333333333333333333333333333333360666606606060606606633333333333333333333333333333333333333333333333333
3333333333333333331b333333333333333333333333333333333333360006606600060066606633333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333366606606606060606606633333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333360066606606060606606633333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333366666666666666666666633333333333333333333333333333333333333333333333333
3333333333333333333333333333333333333333333333333333333333b33b3b3333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333b1b31b1b3333333333333333333333333333333333333333333333333333333333333333
33b3b333333333333333333333333333333333333333333333aaa333333333333333333333333333333333333333333333333333333333333333333333333333
333b33333333333333333333333333333333333333333333333a3333333333333333333333333333333333333333333333333333333333333333333333333333
331b33333333333333333333333333333333333333333333331b3333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333b33333
33333333333333333333333333333333333333333333333333333333333333333333333333b3b3333333333333333333333333333333333333333333393b3333
333333333333333333333333333333333333333333333333333333333333333333333333333b33333333333333333333333333333333333333333333333b3333
333333333333333333333333333333333333333333333333333333333333333333333333331b33333333333333333333333333333333333333333333331b3333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333

__gff__
0000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000300000901000030060303f920309300790031600070000100000000000002e600266002e7002e7002e700265002d7002d7002c7002c700296002a6002b700214002b7002b7002b700000002a7002a70029700
000100000a0100e0101101016010190101c0101f01022010270102901012010100100d0100b0100a0100d0000c0000a0000800007000060000600006000050000400006000020000000000000000000000000000
000400000e050170501f0502b050060000b00013000290000b0000c000000000e0001000011000150001d00025000000000000000000000000000000000000000000000000000000000000000000000000000000
00010000080100c01010010240001d00016000120000e00009000030000200000000000000600001500005000050000500005000050000500155001450013500115000f5000e5000d5000b5000a5000950007500
0001000015710190101b0003770025000240001f0001a000180001200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00010000157101e010387003770025000240001f0001a000180001200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0009000025f2120e203ff2019f0218e0100e000040003400004001e100090020a000020000a000010000400000000000002d40000000000000000000000000000000000000000000000000000000000000000000
0020000007000090020a0010e00012000160021b0012000021000260002b0002f0003500238000180000000000000000000000000000000001a00000000000000000000000000000000000000000000000000000
000200003601039000240003e0003e0003c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000400002e0123f0112700033000180021f001240002200016000130001d0001b00218000180000000000000000000000000000000001a0000000000000000000000000000000000000000000000000000000000
0010000303020050200b02000000040000c0000100004000330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00010000341102610023100010000000000000018003c10036100000003d100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000200002a0002a0002c0002d0002d0002d0002c0002c0002c0002c0002c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00100000140501a05021050290502f0503f0503a05000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
