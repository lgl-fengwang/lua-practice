--�½��ļ�����������
file = io.open("./File.txt", "w")
math.randomseed(os.time())
for i = 1, 200000 do
	file:write(math.random(100000))
	if (i % 10 == 0) then --һ�з���10������
		file:write("\r\n")
	else
		file:write(" ")
	end
end
