source_file = io.open("./File.txt", "r"); --以只读方式打开文件 文件不存在会出错
source_file:seek("set") --定位到文件开头
array = {}
index = 1
while(true) do
	local var = source_file:read("*n")
	if(var == nil) then --读不到数字就退出循环
		break
	end
	array[index] = var
	index = index + 1
end
source_file:close()
index = index - 1 --现在index表示数组的大小
--[[
--冒泡排序
local function bubbleSort(arr)
	--local arrtemp = arr
	for i = 1, index - 1 do
		for j = 1, index - i do
			if (arr[j] > arr[j + 1]) then
				local temp = arr[j]
				arr[j] = arr[j + 1]
				arr[j + 1] = temp
			end
		end
	end
end

local oldTime = os.clock()
bubbleSort(array)
local newTime = os.clock()
print("冒泡排序耗时:", newTime - oldTime)
--]]
--插入排序
local function insertionSort(arr)
	--local arrtemp = arr
	for i = 2, index do
		for j = i, 2, -1 do
			if (arr[j - 1] <= arr[j]) then
				break
			else
				local temp = arr[j]
				arr[j] = arr[j - 1]
				arr[j - 1] = temp
			end
		end
	end
end

oldTime = os.clock()
insertionSort(array)
newTime = os.clock()
print("插入排序耗时:", newTime - oldTime)
--[[
--快排
local function Qsort(arr, low, high)
	--local arrtemp = arr
	if (low >= high) then
		return
	end
	local first = low
	local last = high
	local key = arr[first]
	while(first < last) do
		while(first < last and arr[last] >= key) do
			last = last - 1
		end
		arr[first] = arr[last]
		while(first < last and arr[first] <= key) do
			first = first + 1
		end
		arr[last] = arr[first]
	end
	arr[first] = key
	Qsort(arr, low, first - 1)
	Qsort(arr, first + 1, high)
end

oldTime = os.clock()
Qsort(array, 1, index)
newTime = os.clock()
print("快排耗时:", newTime - oldTime)

--Lua语言本身提供的排序函数
oldTime = os.clock()
table.sort(array)
newTime = os.clock()
print("lua自带函数耗时:", newTime - oldTime)
--]]
target_file = io.open("./TargetFile.txt", "w") --打开只写文件 若文件存在内容会清零 若文件不存在则建立文件

for i, j in ipairs(array) do
	target_file:write(tostring(j))
	if (i % 10 == 0) then --一行放置10个数字
		target_file:write("\r\n")
	else
		target_file:write(" ")
	end
end

target_file:close()
