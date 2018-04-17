source_file = io.open("./File.txt", "r"); --��ֻ����ʽ���ļ� �ļ������ڻ����
source_file:seek("set") --��λ���ļ���ͷ
array = {}
index = 1
while(true) do
	local var = source_file:read("*n")
	if(var == nil) then --���������־��˳�ѭ��
		break
	end
	array[index] = var
	index = index + 1
end
source_file:close()
index = index - 1 --����index��ʾ����Ĵ�С
--[[
--ð������
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
print("ð�������ʱ:", newTime - oldTime)
--]]
--��������
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
print("���������ʱ:", newTime - oldTime)
--[[
--����
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
print("���ź�ʱ:", newTime - oldTime)

--Lua���Ա����ṩ��������
oldTime = os.clock()
table.sort(array)
newTime = os.clock()
print("lua�Դ�������ʱ:", newTime - oldTime)
--]]
target_file = io.open("./TargetFile.txt", "w") --��ֻд�ļ� ���ļ��������ݻ����� ���ļ������������ļ�

for i, j in ipairs(array) do
	target_file:write(tostring(j))
	if (i % 10 == 0) then --һ�з���10������
		target_file:write("\r\n")
	else
		target_file:write(" ")
	end
end

target_file:close()
