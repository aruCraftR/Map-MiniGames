function lobby/getrandom1
execute if score random board matches 1 run title @s title ["\u00a7a世间万物皆有裂痕，那是光照进来的地方。"]
execute if score random board matches 1 run title @s subtitle ["\u00a7e —— 莱昂纳德·科恩《颂歌》"]
execute if score random board matches 2 run title @s title ["\u00a7a世间多无奈，别被风雪染。世事多无奈，莫随霜雪白。"]
execute if score random board matches 2 run title @s subtitle ["\u00a7e —— 俗语"]
execute if score random board matches 3 run title @s title ["\u00a7a在天鹅的世界里，乌鸦都是有罪的。"]
execute if score random board matches 3 run title @s subtitle ["\u00a7e —— 俗语"]
execute if score random board matches 4 run title @s title ["\u00a7a人们试图把你埋了，但你是颗种子。"]
execute if score random board matches 4 run title @s subtitle ["\u00a7e —— 俗语"]
execute if score random board matches 5 run title @s title ["\u00a7a乌云自己遮住了太阳，它却怨天空不够明朗。"]
execute if score random board matches 5 run title @s subtitle ["\u00a7e —— 俗语"]
execute if score random board matches 6 run title @s title ["\u00a7a你担心什么，什么就控制你。你所拥有的，亦是你的枷锁。"]
execute if score random board matches 6 run title @s subtitle ["\u00a7e —— 约翰·洛克 / 未知"]
execute if score random board matches 7 run title @s title ["\u00a7a我与我周旋久，宁做我。"]
execute if score random board matches 7 run title @s subtitle ["\u00a7e —— 汪曾祺《世说新语》"]
execute if score random board matches 8 run title @s title ["\u00a7a有些人污蔑诋毁你，却又想成为你。"]
execute if score random board matches 8 run title @s subtitle ["\u00a7e —— 俗语"]
execute if score random board matches 9 run title @s title ["\u00a7a没有什么会踏雾而来，喜欢的风景要自己去看。"]
execute if score random board matches 9 run title @s subtitle ["\u00a7e —— 俗语"]
execute if score random board matches 10 run title @s title ["\u00a7a我既年轻又年老，连灵魂都无聊至极。"]
execute if score random board matches 10 run title @s subtitle ["\u00a7e —— 托尼·凯耶《超脱》"]
execute if score random board matches 11 run title @s title ["\u00a7a哀其不幸，怒其不争。从来如此，便对么？"]
execute if score random board matches 11 run title @s subtitle ["\u00a7e —— 鲁迅《孔乙己》&《狂人日记》"]

function lobby/getrandom2
tellraw @s [""]
execute if score random board matches 1 run tellraw @s ["   \u00a7b谁都有难以名状的心情，因此人才会变得难过。"]
execute if score random board matches 2 run tellraw @s ["   \u00a7b有时候，音乐比言语更能诉说心情。\n   要是言语全是音乐的话就好了，我有时会这么想。"]
execute if score random board matches 3 run tellraw @s ["   \u00a7b适度的恐惧是人生的香料，如同吊桥会成为回忆一般。\n   人心就是这么不可思议。"]
execute if score random board matches 4 run tellraw @s ["   \u00a7b如果认为只要发出声音就能变成音乐，那就大错特错了。\n   因为静寂也是音乐的一部分。"]
execute if score random board matches 5 run tellraw @s ["   \u00a7b人生不止是道别，人生何处不相逢。"]
execute if score random board matches 6 run tellraw @s ["   \u00a7b今日永远不同于昨日，所以今日才那么美好，不过也会令人有些寂寞。\n   这份寂寞的苦涩会日复一日地加深，咖啡也一样。"]
execute if score random board matches 7 run tellraw @s ["   \u00a7b青春总是焦急的，连一勺砂糖溶于杯中的时间都等不及。"]
execute if score random board matches 8 run tellraw @s ["   \u00a7b后悔带来的苦涩，是对过去的见证，终将逐一化为杯中咖啡的味道。"]
execute if score random board matches 9 run tellraw @s ["   \u00a7b有些东西，只有放手后才能得到，也许并不是只有握在手里才是幸福的。"]
tellraw @s ["\u00a77    —— 玉子市场 · 咖啡店人生导师\n"]