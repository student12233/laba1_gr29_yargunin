
# chastota=File.open("chastota.txt","r"){ |file| file.read }.split("\n")
	# chas_up=Array.new(chastota.size) { |i|  chastota[i].split }
def method_len(mass)
return mass.sort{|x,y|x.size<=>y.size}
end
def method_kolwo_slow(mass)
return mass.sort{|x,y| x.scan(/[a-zA-ZА-Яа-я]/).size<=>y.scan(/[a-z]|[A-Z]|[А-Я]|[а-я]/).size}
end

def method_7(mass)
	 mass.sort_by{|x| (x.scan(/[йцкнгшщзхъфвпрлджчсмтьб]{1}[ёеыаоэяию]{1}/).size-x.scan(/[ёеыаоэяию][йцкнгшщзхъфвпрлджчсмтьб]{1}{1}/).size)**2}
end
def method_12(mass)
mass.sort_by{|x_sort|  (((mass.inject(""){|sum,x|sum+=(x+" ")}.scan(	mass.inject(""){|sum,x|sum+=(x+" ")}.chars.max_by{|max| mass.inject(""){|sum,x|sum+=(x+" ")}.scan(max).size}).size)/(mass.inject(""){|sum,x|sum+=(x+" ")}.size))-((x_sort.scan(mass.inject(""){|sum,x|sum+=(x+" ")}.chars.max_by{|max| mass.inject(""){|sum,x|sum+=(x+" ")}.scan(max).size}).size)/(x_sort.size)))**2}
end
def method_5(mass)
mass.sort_by{|x_sort| ( ((x_sort.scan(x_sort.chars.max_by{|x_max| x_sort.scan(x_max).size }).size)/(x_sort.size))-((x_sort.chars.max_by{|x_max| x_sort.scan(x_max)}.size )/(mass.inject(""){|sum,x|sum+=(x+" ")}.size)))**2 }
end
def method_3(mass)
mass.sort_by{|x_sort| ( ((x_sort.scan(x_sort.chars.max_by{|x_max| x_sort.scan(x_max).size }).size)/(x_sort.size))-((x_sort.chars.max_by{|x_max| x_sort.scan(x_max)}.size )/(mass.inject(""){|sum,x|sum+=(x+" ")}.size)))**2 }
end


puts "введите номер задачи"
number=STDIN.gets.chomp
args = File.open("input.txt","r"){ |file| file.read }.split("\n")
	puts eval ("method_#{number}(#{args})")