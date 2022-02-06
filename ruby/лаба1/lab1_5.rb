def method_3(str)
return	str.split.shuffle.inject(""){|sum,x|sum+=(x+" ")}.strip!
end
def method_8(str)
	return str.split.select{|x| x.size%2==0}.size
end
def method_16(mass)
return  mass.sort{|a,b| ["белый","синий","красный"].index(a)<=>["белый","красный","синий"].index(b)}
end
def method_d(str)
return str.scan(/(\s|^)+(3[0-1]|0[1-9]|[12][1-9])(\s)+(января|февраля|марта|апреля|мая|июня|июля|августа|сентября|октября|ноября|декабря){1}(\s)+([1-9][0-9]{3}|[1-9][0-9]{2})/)
end
def method2_3(str)
return str.scan(/[а-я]{1}|[А-Я]{1}/).size
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




