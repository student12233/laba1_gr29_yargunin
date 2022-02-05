def method_51_L1(mass)
 return  mass.uniq
end

def method_51_L2(mass)
	mass_un = method_51_L1(mass)
return mass_un.map{|x| x=mass.select{|y| y==x}.size}
end



if ARGV[0]=="клава" then
	puts "введите массив"
	string=(STDIN.gets.chomp).split(",").map!{|x| x.to_i}
else
	string = File.open(ARGV[1],"r"){ |file| file.read }
string=string.split(",").map!{|x| x.to_i}
end
puts method_51_L1(string)
puts method_51_L2(string)


