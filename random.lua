--新建文件并填充随机数
file = io.open("./File.txt", "w")
math.randomseed(os.time())
for i = 1, 200000 do
	file:write(math.random(100000))
	if (i % 10 == 0) then --一行放置10个数字
		file:write("\r\n")
	else
		file:write(" ")
	end
end
