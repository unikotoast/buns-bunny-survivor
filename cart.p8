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
0000000000000000000000000000000000eeeee000eeeee000eeeee000eeeee0000000000077700d000000000005900006777000077770000000000000000000
000000000000000000000000000000000000000000eeeeee00eeeeee00000000000000000717100d0077700d0019a9000d67777000777770000c00c000c00c00
000000000000000000000000000000000eeeeeee0eeeeeee0eeeeeee0eeeeeee0eeeeeee677770d06717100d0114941000d667770000007700ccc0cc00cc0cc0
0000000000000000000000000000000000000000eeeeeeeeeeeeeeee0000000000000000606067d0677770d001d14110000d66770000000700c1cc1c0c1cc1cc
00000000000000000000000000000000ee0eeee0ee0eee00ee0eee00ee0eee00ee0eee0000600000006067d001111d10000dd677000000070c11111c0c11111c
0000000000000000000000000111111000000000e0eeeee0e0eeeee0000000000000000007776000677700000111d11000dd6777000000070c17117c0c17117c
00000000000000000000000011111111000eee00000eee00000eee00000eee00000eee0060000700700060000f1111f00dd677700000007000c1111c00c1111c
0000000000000000000000000111111000000e0000000e0000000e0000000e00000000007000000000007000000000f0dd67700000000000000cccc0000cccc0
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
00000000000000000000009900000000000000000006da7700000000000000000000000000000000080080800eeee00000000b00a00a00000000000000000000
00000000000000000000b99400000000000b0b00000daa770000000002000000010000010007770000888880e799ee00000f99b00a99a990000000000a00b0b0
000000000000000000000b40b0000000009bb000006dadaa02000000001000010110008007774f708887777879999e6000f7940099a77a99eeeff7000009bb00
0000000000000000000000b00b9799400049bb0000deeaad01200010001108000000000077f4ff700877e7e7e9a5a50007777770a7797979000667000a049bb0
00000000000000000b000000bb7999990499900000d82ddd0011800000000000000000007999997008777777eeaa550006fff9609a7777770eee66770a999900
000000000000000009b000000b949440099000000551dd000001112010001000000000007fffff70887e7ee702e22560006f960097979977000666670a990000
0000000000000000994b0000b000000000000000d51000000011000000001012100000007444447000877ee7000002560006600099779977eeee555509aaa0a0
00000000000000009400000000000000001100005100000001000100000100000000100200000000080877770000002500666600099777770000000000000000
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
000202000000002000000200000000000004999000099400b00000000000000000000000700000000097a700000e07770000000000d66777000000000b0000b0
0077007707700770000000000000000000999940000499000b499440000000000000070000000000000a700000e0ee0e00000000000d66770000000000000000
00770077077707770077007700000000bbb9440000099400bb99999900000000007000000000007000a7a7000e0ee0e000000000000dd6770000000000000000
007f77f7007f77f7007770777000000000bb9000000499000b9494400000000000000000000000000aa80a7000ee0e000000000000dd6777000000000b0000b0
00777777000777777007f77f700000000b0b0000000bbb00b0000000000000000000000000000000a00000a90e00e000000000000dd677700000000093b00b39
07777f77007777f77077777777000000000b000000b0b0b00000000000000000000000000000a0000000000ae00e000000000000dd6770000000000094000094
077f1f170777f1f17777777f7700000000000000000000000000000000000000900000000009000a0770077000000707000bb0bb000000000000000000000bb0
077ffff77777ffff77777f1f1700000000000000500020200000000009000000000000000900a09a1cc01880000ee7770000bbb3000000000caaa9900bb0e200
077222007777222000077ffff0000000000000005000555000900000000000000000900aa00a90a91cc018800000077700093b3000070000ca000099e2002200
07f171f0000f171f000002710000000000000000050015100000000000090000a00000a09a7aa70a1cc0188000ee0ee00074933300066700c009900922000000
00e11100000021100000f112f0000000000000000500555000090000a00000a0000000000a0000a01ccc8880000000000799990300766000c0090099000000bb
000202000000002000000200000000000000000000551a100a000a0000000a00000000007090090701cc88007e7ee0000999400000007000cc09999000bb0e20
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
0077777700777777007777777700000002eee2000055500000555000000000000c000000000000c0c0049799f77779b7f77f79bf0000000000eef0ffff0f0000
0077777700077770000777777000000000222000000000000000000000c0c000000c0c0000cc0000000044440777749007777490000000000000012221000000
000777700000211000007777000000000000000000000000000000000000000000000000000000000000000008008008000c7000000c70000000001e10000000
0002020000000020000002000000000000000000000000000000000000000000000000000000000000000000000afa0000cc770000cc77000000001110000000
0077077000770007700000000000000000dbdb0000dbdb0000dbdb000770770007707700077077000000000000af99a00cc8c8700cc8c8700000002020000000
007707700077707770077000770000000d9b35000d9b35000d2135007ee7ee607ee71160711711600000000008f994f80111ccc00111ccc00000000000000000
007fef700007fef700077707770000000d99bb000d99bb000d211b006e828e606e811160611111600000000000bb4fa00011cc000011cc000000000000000000
00eeeee0000eeeee00077fef77000000d9944500d2144500d211150006222600062116000611160000000000000bfa000001c0000001c0000000000000000000
00eefee0000eefee0000eeeee0000000d9455000d1155000d115500000d2d00000d1d00000d1d000000000000800800800000000000000000000000000000000
0ee1f1ee00ee1f1ee000eefee0000000555000005550000055500000000d0000000d0000000d0000000000000000000000011000000110000000000000000000
0eefffee00eefffee00ee1f1ee00000007700770000000000000000000888800000000000000000000000000880000cc00070007000000009000000700000070
0ee222ee00ee222ee00eefffee0000001cc018800aa00aa000000000080000800088880000000000000000008000000c0e700e700000000009700a7000700700
0ef1e1fe00ef1e1ee00ee2e2fe0000001cc018801cc01880000000008000000808000080000000000000000000800c00e70007000000a0000097a70090000000
00e111e0000e211f0000f112e00000001cc018801cc018800000000080077008080770800000000000000000000ee000000e7000000a7a00000a700000000000
000202000000002000000200000000001ccc88801cc018800000000080077008080770800000000000000000000ee00000e7e7000000a00000a7a70000000070
0077007707700007700000000000000001cc88001ccc8880000000008000000808000080000000000000000000c008000ee20e70000000000aa80a70000000a9
007700770777007770770000770000000011100001cc88000000000008000080008888000000000000000000c0000008e00000e200000000a00000a90a000000
0077777700777777007770077700000000000000001110000000000000888800000000000000000000000000cc0000880000000e000000000000000aa0000000
0077777700777777000777777000000007776600000000000800080000cccc0000000000000000000000000000000000000e7000000000000008700000000000
007777770e777777e0077777700000007887886008808800080008000c0000c000cccc0000000000000000000000000000ee7700000000000088770000087000
00e7777e0ee7777ee0e777777e000000788788600880880008000800c000000c0c0000c0007b7b00007b7b00000000000ee1e170000ee0000881817000887700
00eeeeee0eeeeeeee0ee7777ee000000088788000880880008000800c007700c0c0770c0079b3f00079b3f00000000000222eee00eee77e00222888008888770
00eeeeee00eeeeee00eeeeeeee000000777877600888880008000800c007700c0c0770c00799bb000799bb00000000000022ee000eeee7700022880002218180
00eeeeee000eeee0000eeeeee0000000000000000880880008000800c000000c0c0000c079944f0007f44f00000000000002e0000221e1e00002800000228800
000eeee0000021100000eeee000000000616160008808800080008000c0000c000cccc00794ff00000fff00000000000000000000222eee00000000000028000
0002020000000020000002000000000000000000000000000800080000cccc0000000000fff00000000000000000000000011000001111000001100000111100
__label__
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
3337333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333b333b33333333333333333333333333
337a7333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333b33b3b333333333333b33333333333
333733333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333b1b31b1b33333333333b333333333333
331b3333333333333333333333333000000000000000000003333333333333333333333333333333333333333333333333333333333333333333b33333333333
333333333333333333333333300000000000000000000000000003333333333333333333333333333333333333333333333333333333333333b1b33b33333333
33333333333333333333330000000000000000000000000000000000033333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333000000000000000000000000000000000000000033333333333333333333333333000000000000003333333333333333333333333333
33333333333333333300000000000000000000000000000000000000000000003333333333333333330000000000000000000000333333333333333333333333
33333333333333333000000000000000000000000000000000000000000000000003333333333330000000000000000000000000000333333333333333333333
333333333333b3300000000000000000000000000000000000000000000000000000003333330000000000000000000000000000000003333333333333333333
33333333333b33000000000000000000000000000000000000000000000000000000000003000000000000000000000000000000000000333333333333333333
333333333333b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003333333333333333
3333333333b100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000333333333333333
33333333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000033333333333333
3333333333000000000000000000000000000000000000000000eeeeee00ee00ee00eeee000000eeee0000000000000000000000000000000003333333333333
3333333330000000000000000000000000000000000000000000e777777ce77ce77ce7777c0000e7777c00000000000000000000000000000000333333333333
3333333300000000000000000000000000000000000000000000e777777ce77ce77ce7777e00ee07777c00000000000000000000000000000000033333333333
3333333300000000000000000000000000000000000000000000e77ce77ce77ce77ce77ce77ce77c000000000000000000000000000000000000003333333333
3333333000000000000000000000000000000000000000000000e77e077ce77ce77ce77ce77ce77eee0000000000000000000000000000000000003333333333
3333333000000000000000000000000000000000000000000000e7777c00e77ce77ce77ce77ce777777c00000000000000000000000000000000000333333333
3333330000000000000000000000000000000000000000000000e7777e00e77ce77ce77ce77c0777777c00000000000000000000000000000000000333333333
3333330000000000000000000000000000000000000000000000e77ce77ce77ce77ce77ce77c0000e77c00000000000000000000000000000000000333333333
3333330000000000000000000000000000000000000000000000e77ee77c077ee77ce77ce77ceeee077c00000000000000000000000000000000000333333333
3333330000000000000000000000000000000000000000000000e777777c00e7777ce77ce77ce7777c0000000000000000000000000000000000000333333333
33333300000000000000000000000000000000000000000000000777777c0007777c077c077c07777c0000000000000000000000000000000000000333333333
33333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000333333333
33333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000333333333
33333330000000000000000000000000000000eee0e0e0ee00ee00e0e000000ee0e0e0eee0e0e0eee0e0e00ee0eee00000000000000000000000003333333333
33333330000000000000000000000000000000e0e0e0e0e0e0e0e0e0e00000e000e0e0e0e0e0e00e00e0e0e0e0e0e00000000000000000000000003333333333
33333333000000000000000000000000000000ee00e0e0e0e0e0e0eee00000eee0e0e0ee00e0e00e00e0e0e0e0ee000000000000000000000000033333333333
33333333300000000000000000000000000000e0e0e0e0e0e0e0e000e0000000e0e0e0e0e0eee00e00eee0e0e0e0e00000000000000000000000033333333333
33333333330000000000000000000000000000eee00ee0e0e0e0e0eee00000ee000ee0e0e00e00eee00e00ee00e0e00000000000000000000000333333333333
33333333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003333333333333
33333333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003333333333333
33333333333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000033333333333333
33333333333333330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000333333333333333
33333333333333333300000000000000000000000000000000003330000000000000000000000000000000000000000000000000000000003333333333333333
33333333333333333333000000000000000000000000000000333333330000000000000000000000000000000000000000000000000000333333333333333333
33333333333333333333333000000000000000000000000333333333333333000000000000000000000000000000000000000000000003333333333333333333
33333333333333333333333333330000000000000003333333333333333333333300000000000000000000000000000000000000000333333333333333333333
33333333333333333333333333333333333333333337333333333333333333333333300000000000000000000000000000000000033333333333333333333333
33333333333333333333333333333333333333333379733333333333333333333333b33333000000000000000000000000000033333333333333333333333333
333333333333333333333333333333333333333333b7b3333333333333333333333b333333333330000000000000000000333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333b33333333333333333333333333333333333333333333333333333333333
333333333333333333333333333333333333333333333333333333333333333333b1b33b33333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333373333333
3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333b33a333
3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333b333b33
3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333331b3b1b3b
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333733333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333337a73333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333733333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333331b33333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333377377333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333373333333333333377377333333333333333333b333b3333333333333333333333333333373333
3333333333333333333333333333333333333333333333333379733333333333337fef73333333333333333333b33b3b3333333333333eeeee33333333797333
33333333333333333333333333333333333333333333333333b7b3333333333333eeeee33333333333333333b1b31b1b333333333333eee3eee3333333b7b333
3333333333333333333333333333333333333333333333333333333333333333eeeefee3333333333333333333333333333333333333ee333ee3333333333333
333333333333333333333333333333333333333333333333333333333333333eeee1f1ee333333333333333333333333333333333333ee333ee3333333333333
333eeeee333333e3e3333337737373377337737773333333333333333333333eeeefffee3333333333333333333333333333333333333eeeee33333333333333
33ee3e3ee33333e3e3333373337373737373733733333333333333333333333eeee222ee33333333333333333333333333333333333333333333333333333333
33eee3eee333333e333333777377737373737337333333333333333333333333eef1e1fe33333333333333333333333333333eeeee333eeeee333eeeee333333
33ee3e3ee33733e3e3333333737373737373733733333333333333333333333333e111e33333333333333333333333333333eee33ee3ee333ee3ee33eee33333
333eeeee337a73e3e33333773373737733773337333333333333333333333333333232333333333333333333333333333333ee333ee3ee333ee3ee333ee33333
3333333333373333333333333333333333333333333333333333333333333333333333333333333333333333333333333333eee33ee3eee3eee3ee33eee33333
33333333331b33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333eeeee333eeeee333eeeee333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333eeeee333333eee333337733777337737373333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33ee333ee3333333e333337373737373337373333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33ee3e3ee333333e3333337373777377737773333333333333333333333333333333333333333333333333333333333333333333777337737373777333333333
33ee333ee33333e33333337373737333737373333333333333333333333333333333333333333333333333333333333333333333777373737373733333333333
333eeeee333333eee333337773737377337373333333333333333333333333333333333333333333333333333333333333333333737373737373773333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333737373737773733333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333737377333733777333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
3333333333333333333333333333333333333333333333333333c333333333333333333333333333333333333333333333333333333333333333333333333333
333333333333333333333333333333333333333333333333b3b33b33333333333333333333333333333333333333333333333333333333333333333333333333
3333333333333333333333333333333333333333333333331b331b33333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33373333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333733333333333333333333
337a7333333333333333333333333333333333333333333333333333333333333777773333333333333333333333333333333333337973333333333333333333
3337333333333333333333333333333333333333333333333333333333333333777776633333333333333333333333333333333333b7b3333333333333333333
331b3333333333333333333333333333333333333333333333333333333333337117116333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333337117116333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333337771776333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333337766666333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333616163333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333b33333333333333333333333333333333333333333333333333333333333
333333333333c333333333333333c3333333333333333333333333333666666666666666666666333333c3333333c33333333333333333333333333333333333
33333333b3b33b3333333333b3b33b33333333333333333373333333366006000600060006000633b3b33b33b3b33b3333333333333333333333333333333333
333333331b331b33333333331b331b3333333333333333333b33a3333606666066060606066066331b331b331b331b3333333333333333333333333333333333
3333333333333333333333333333333333333333333333333b333b33360006606600060066606633333333333333333333333333333333333333333333333333
3333333333333333333333333333333333333333333333331b3b1b3b366606606606060606606633333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333360066606606060606606633333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333366666666666666666666633333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333c3333333333333333333
333333333333333333333333333333333333333333333333333333333333333333aaa33333333333333333333333333333333333b3b33b333333333373333333
3333333333333333333333333333333333333333333333333333333333333333333a3333333333333333333333333333333333331b331b33333333333b33a333
3333333333333333333333333333333333333333333333333333333333333333331b33333333333333333333333333333333333333333333333333333b333b33
3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333331b3b1b3b
33333333333333333333333333333333336363663366636363366366633663666336636663333333333333333333333333333333333333333333663333336663
33666336636633666333336633636333336363636336336363636336336363636363333633333333333333333333333333333333333333333333363333333363
33666363636363663333336633666333336363636336336633636336336363666366633633333333333333333333333333333333333333333333363333336663
33636366636363633333336363336333336363636336336363636336336363636333633633333333333333333333333333333333333333333333363333336333
33636363636633366333336663663333333663636366636363663336336633636366333633333333333333333333333333333333333333333333666336336663
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333
33333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333

__gff__
0000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
000300000907000070060703f970309703f50031600070000100000000000002e600266002e7002e7002e700265002d7002d7002c7002c700296002a6002b700214002b7002b7002b700000002a7002a70029700
000100000a0100e0101101016010190101c0101f01022010270102901012010100100d0100b0100a0100d0000c0000a0000800007000060000600006000050000400006000020000000000000000000000000000
000400000e050170501f0502b050060000b00013000290000b0000c000000000e0001000011000150001d00025000000000000000000000000000000000000000000000000000000000000000000000000000000
00010000080200c02010020240001d00016000120000e00009000030000200000000000000600001500005000050000500005000050000500155001450013500115000f5000e5000d5000b5000a5000950007500
0001000015720190201b0003770025000240001f0001a000180001200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00010000157201e020387003770025000240001f0001a000180001200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0009000025f3120e303ff3019f0218e0100e000040003400004001e100090020a000020000a000010000400000000000002d40000000000000000000000000000000000000000000000000000000000000000000
0020000007000090020a0010e00012000160021b0012000021000260002b0002f0003500238000180000000000000000000000000000000001a00000000000000000000000000000000000000000000000000000
000200003603039000240003e0003e0003c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000400002e0223f0212700033000180021f001240002200016000130001d0001b00218000180000000000000000000000000000000001a0000000000000000000000000000000000000000000000000000000000
0016000303020050200b0200b020060200b02002020070200b0200402006020020200302006020020200002000000000000000000000000000000000000000000000000000000000000000000000000000000000
00010000341302610023100010000000000000018003c10036100000003d100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4a0100003b65030650156501b65018650176301a6401a6401a64019640176401364013640176401a6400c6401d630126300f6300e6200d6200962009620056200361002610006100161000600006000060000600
0005000013050150401c0501f05023040230302302023010230202301023020230002300023000230002300023000230002300023000230002300023000000000000000000000000000000000000000000000000
000200001d0101f0202103029020300102e0003d000320003d000360003c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
d702000005053070530b05310053130531405315053140431204311043100430d0430a04309033070330503303023020230201301013010130201302013010130201301013010130101300003000030000300003
11050000050120601207022090320b0320d0421004211052130521505218052180521805218052180521805218055180551804518045180351803518025180250000200002000020000200002000020000200002
00040000313152e3252c3352934526345233551f3551d3551a3451633513325103150d3150b3150b3150b3150a0150902508025080350703506045050450304502035010250002500015000051e3051a30517305
000100000b6100e61013610156101a61016600096100a6100d6100e6100a610056100261002600016000161002610016100360001600016000260001600016000260000000000000000000000000000000000000
000900001b75015750107502670037700237002a70000000090000000009000000000900000000090000000009000000000900000000090000000009000000000900000000090000000009000000000900000000
00040000313252e3352c3552936526375233751f3751d3751a3751636513345103450d3350b3350b3250b3250a0150901508025080350704506055050650307502075010650004500025000551e3051a30517305
01140020213651a3451e345213551a3451e345153651a345213651a3451e345153551a3451e345153651a34521365183451c34515365183451c345153651834515355173451c34515365173451c3451536517345
000100001b01000600086002600000000380000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00040000060110b0211003515035190351c0351c035280351c0353403526035300352403530035240253001524000240002400024000240002400024000240002400024000240002400024000240000000000000
00030000030300c030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
03 15424344

