def method_3(str)
return	str.split.shuffle.inject(""){|sum,x|sum+=(x+" ")}.strip!
end
def method_8(str)
	return str.split.select{|x| x.size%2==0}.size
end
def method_16(mass)
return  mass.sort{|a,b| ["белый","синий","красный"].index(a)<=>["белый","красный","синий"].index(b)}
end

puts "введите номер задачи"
number=STDIN.gets.chomp
puts "введите аргумент"
arg=STDIN.gets.chomp
if number=="16" then
	puts eval ("method_#{number}(#{arg})")
else
	puts eval ("method_#{number}(\"#{arg}\")")
end