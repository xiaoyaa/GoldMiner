
module("Level", package.seeall)

function getItemData(config)
	local itemData = ITEM[tonumber(config)]
	if not itemData then
		  itemData = ITEM[1]
	end
	return itemData
end

function getBG_ITEM(config)
	local itemData = BG_ITEM[tonumber(config)]
	if not itemData then
		itemData = BG_ITEM[1]
	end
	return itemData
end

function getLIMIT_ITEM(config)
	local itemData = LIMIT_ITEM[tonumber(config)]
	if not itemData then
		itemData = 1000000000000000
	end
	return itemData
end

LIMIT_ITEM = {600,2000,3500,5000,7500,10000}

BG_ITEM = {
	"gameBg/mineBG1.png",
	"gameBg/mineBG2.png",
	"gameBg/mineBG3.png",
	"gameBg/mineBG4.png",
	"gameBg/mineBG5.png",
	"gameBg/mineBG6.png"

}

local pic_path_tab = {
	"goods/gold_small.png",
	"goods/gold_middle.png",
	"goods/gold_large.png",
	"goods/stone_small.png",
	"goods/stone_middle.png",
	"goods/stone_large.png",
	"goods/secret_small.png",
	"goods/secret_middle.png",
	"goods/secret_large.png",
	"goods/diamond_small.png",
	"goods/diamond_middle.png",
	"goods/diamond_large.png"
}
--[[
require("app.scenes.MyData")



local StoneNumber = {5,8,10,12,15,18}
local GoldNumber = {5,8,10,12,15,18}
local SecretNumber = {0,1,2,3,4,5}
local DiamondNumber = {0,1,2,3,4,5}


for i=1,6 do
   for j=1, StoneNumber[Mydata:getLevel()] do
end
end

math.randomseed(os.time())
local x = math.random(0,480)
local y = math.random(0,100)
]]


ITEM = {}

ITEM[1] = {}

ITEM[1][1] = {pic = pic_path_tab[1], pos = ccp(100, 100), weight = 10, price = 50}
ITEM[1][2] = {pic = pic_path_tab[1], pos = ccp(90, 39), weight = 10, price = 50}
ITEM[1][3] = {pic = pic_path_tab[1], pos = ccp(400, 50), weight = 10, price = 50}
ITEM[1][4] = {pic = pic_path_tab[1], pos = ccp(230, 47), weight = 10, price = 50}
ITEM[1][5] = {pic = pic_path_tab[1], pos = ccp(49, 98), weight = 10, price = 50}
ITEM[1][6] = {pic = pic_path_tab[2], pos = ccp(27, 50), weight = 50, price = 200}
ITEM[1][7] = {pic = pic_path_tab[2], pos = ccp(420, 33), weight = 50, price = 200}
ITEM[1][8] = {pic = pic_path_tab[2], pos = ccp(330, 44), weight = 50, price = 200}
ITEM[1][9] = {pic = pic_path_tab[2], pos = ccp(480, 80), weight = 50, price = 200}
ITEM[1][10] = {pic = pic_path_tab[2], pos = ccp(90, 89), weight = 50, price = 200}

ITEM[2] = {}

ITEM[2][1] = {pic = pic_path_tab[1], pos = ccp(190, 100), weight = 10, price = 50}
ITEM[2][2] = {pic = pic_path_tab[1], pos = ccp(390, 39), weight = 10, price = 50}
ITEM[2][3] = {pic = pic_path_tab[1], pos = ccp(400, 50), weight = 10, price = 50}
ITEM[2][4] = {pic = pic_path_tab[1], pos = ccp(52, 89), weight = 10, price = 50}
ITEM[2][5] = {pic = pic_path_tab[1], pos = ccp(96, 99), weight = 10, price = 50}
ITEM[2][6] = {pic = pic_path_tab[2], pos = ccp(255, 23), weight = 50, price = 200}
ITEM[2][7] = {pic = pic_path_tab[2], pos = ccp(420, 29), weight = 50, price = 200}
ITEM[2][8] = {pic = pic_path_tab[2], pos = ccp(96, 10), weight = 50, price = 200}
ITEM[2][9] = {pic = pic_path_tab[3], pos = ccp(0, 0), weight = 100, price = 500}
ITEM[2][10] = {pic = pic_path_tab[3], pos = ccp(56, 24), weight = 100, price = 500}
ITEM[2][11] = {pic = pic_path_tab[3], pos = ccp(89, 78), weight = 100, price = 500}
ITEM[2][12] = {pic = pic_path_tab[5], pos = ccp(469, 78), weight = 50, price = 30}
ITEM[2][13] = {pic = pic_path_tab[5], pos = ccp(475, 10), weight = 50, price = 30}


ITEM[3] = {}

ITEM[3][1] = {pic = pic_path_tab[1], pos = ccp(100, 100), weight = 10, price = 50}
ITEM[3][2] = {pic = pic_path_tab[1], pos = ccp(90, 39), weight = 10, price = 50}
ITEM[3][3] = {pic = pic_path_tab[1], pos = ccp(400,56), weight = 10, price = 50}
ITEM[3][4] = {pic = pic_path_tab[1], pos = ccp(85, 14), weight = 10, price = 50}
ITEM[3][5] = {pic = pic_path_tab[1], pos = ccp(456, 59), weight = 10, price = 50}
ITEM[3][6] = {pic = pic_path_tab[2], pos = ccp(412, 56), weight = 50, price = 200}
ITEM[3][7] = {pic = pic_path_tab[2], pos = ccp(89, 99), weight = 50, price = 200}
ITEM[3][8] = {pic = pic_path_tab[2], pos = ccp(98, 14), weight = 50, price = 200}
ITEM[3][9] = {pic = pic_path_tab[3], pos = ccp(96, 23), weight = 100, price = 500}
ITEM[3][10] = {pic = pic_path_tab[3], pos = ccp(47, 74), weight = 100, price = 500}
ITEM[3][11] = {pic = pic_path_tab[3], pos = ccp(333, 33), weight = 100, price = 500}
ITEM[3][12] = {pic = pic_path_tab[5], pos = ccp(444, 44), weight = 50, price = 30}
ITEM[3][13] = {pic = pic_path_tab[5], pos = ccp(222, 22), weight = 50, price = 30}
ITEM[3][14] = {pic = pic_path_tab[5], pos = ccp(111, 11), weight = 50, price = 30}
ITEM[3][15] = {pic = pic_path_tab[8], pos = ccp(69, 33), weight = 10, price = 200}
ITEM[3][16] = {pic = pic_path_tab[9], pos = ccp(96, 33), weight = 20, price = 500}


ITEM[4] = {}


ITEM[4][1] = {pic = pic_path_tab[1], pos = ccp(160, 100), weight = 10, price = 50}
ITEM[4][2] = {pic = pic_path_tab[1], pos = ccp(390, 9), weight = 10, price = 50}
ITEM[4][3] = {pic = pic_path_tab[1], pos = ccp(45, 54), weight = 10, price = 50}
ITEM[4][4] = {pic = pic_path_tab[1], pos = ccp(459, 95), weight = 10, price = 50}
ITEM[4][5] = {pic = pic_path_tab[1], pos = ccp(480, 0), weight = 10, price = 50}
ITEM[4][6] = {pic = pic_path_tab[2], pos = ccp(265, 10), weight = 50, price = 200}
ITEM[4][7] = {pic = pic_path_tab[2], pos = ccp(26, 14), weight = 50, price = 200}
ITEM[4][8] = {pic = pic_path_tab[2], pos = ccp(69, 96), weight = 50, price = 200}
ITEM[4][9] = {pic = pic_path_tab[3], pos = ccp(48, 84), weight = 100, price = 500}
ITEM[4][10] = {pic = pic_path_tab[3], pos = ccp(93, 39), weight = 100, price = 500}
ITEM[4][11] = {pic = pic_path_tab[3], pos = ccp(59, 10), weight = 100, price = 500}
ITEM[4][12] = {pic = pic_path_tab[5], pos = ccp(445, 3), weight = 50, price = 30}
ITEM[4][13] = {pic = pic_path_tab[5], pos = ccp(470, 59), weight = 50, price = 30}
ITEM[4][14] = {pic = pic_path_tab[5], pos = ccp(463, 25), weight = 50, price = 30}
ITEM[4][15] = {pic = pic_path_tab[8], pos = ccp(30, 15), weight = 10, price = 200}
ITEM[4][16] = {pic = pic_path_tab[9], pos = ccp(472, 58), weight = 20, price = 500}









--[[typedef enum
{
	item_gold,
	item_stone
}things]]

--[[function CreateEnumTable(tbl, index)
	assert(IsTable(tbl))
	local enumtbl = {}
	local enumindex = index or 0
	for i, v in pairs(tbl) do
		enumtbl[v] = enumindex + i

	end

	return enumtbl
end
EnumTable = {
	"et1",
	"et2"
}

EnumTable = CreateEnumTable(EnumTable)
print(EnumTable.et1)
print(EnumTable.et2)
]]

