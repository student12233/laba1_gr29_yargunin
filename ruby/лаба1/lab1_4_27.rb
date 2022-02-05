
def method_27(mass)
return mass[1,mass.size-1]+[mass[0]]
end










# if ARGV[0]=="клава" then
# 	puts "введите массив"
# 	string=(STDIN.gets.chomp).split(",").map!{|x| x.to_i}
# else
# 	string = File.open(ARGV[1],"r"){ |file| file.read }
# string=string.split(",").map!{|x| x.to_i}
# end
puts method_27([1,2,3,4])

