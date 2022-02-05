def method15(mass,i)
	if i ==0 and mass[i]<mass[i+1]
		return true
	end
	if i ==mass.size-1 and mass[i]<mass[i-1]
		return true
	end

return (1..mass.size-2).select{|x| mass[x]<mass[x-1] and mass[x]<mass[x+1]}.include?(i)
end

if ARGV[0]=="клава" then
	puts "введите массив"
	string=(STDIN.gets.chomp).split(",").map!{|x| x.to_i}
	puts "введите индекс"
	i=(STDIN.gets.chomp).to_i
else
	string = File.open(ARGV[1],"r"){ |file| file.read }
string=string.split(","," ").map!{|x| x.to_i}
i=string.last
string.delete_at(string.size-1)
end
puts method_15(string,i)

