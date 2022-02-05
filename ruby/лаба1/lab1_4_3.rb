def method_3(mass,i)
return mass[i]== mass.max
end
	if ARGV[0]=="клава" then
	puts "введите массив"
	string=(STDIN.gets.chomp).split(",").map!{|x| x.to_i}
else
	string = File.open(ARGV[1],"r"){ |file| file.read }
string=string.split(",").map!{|x| x.to_i}
end
puts method_3(string)
