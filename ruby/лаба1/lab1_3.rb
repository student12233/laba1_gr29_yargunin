def min(arg)
	min=arg[0]
	for i in arg do
		if min>i
			min=i
		end
	end
return min
end
def max(arg)
max=arg[0]
for i in arg do
	if max<i
		max=i
	end
end
return max
end
def sum(arg)
summ=0
for i in arg do
	summ+=i
end
return summ
end
def mult(arg)
multt=1
for i in arg do
	multt*=i
end
return multt
end

if ARGV[1]=="клава" then
	puts "введите массив"
	string=(STDIN.gets.chomp).split(",").map!{|x| x.to_i}
else
	string = File.open(ARGV[2],"r"){ |file| file.read }
string=string.split(",").map!{|x| x.to_i}
end

puts eval(ARGV[0]+"(string)")

