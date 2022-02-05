def method_27(mass)
 mass.each_with_index{puts e if i%2 == 0}
 mass.each_with_index{puts e if i%2 != 0}
end
if ARGV[0]=="клава" then
	puts "введите массив"
	string=(STDIN.gets.chomp).split(",").map!{|x| x.to_i}
else
	string = File.open(ARGV[1],"r"){ |file| file.read }
string=string.split(",").map!{|x| x.to_i}
end


