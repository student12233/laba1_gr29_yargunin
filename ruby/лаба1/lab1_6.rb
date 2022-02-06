

def method_len(mass)
return mass.sort{|x,y|x.size<=>y.size}
end
def method_kolwo_slow(mass)
return mass.sort{|x,y| x.scan(/[a-zA-ZА-Яа-я]/).size<=>y.scan(/[a-z]|[A-Z]|[А-Я]|[а-я]/).size}
end

puts "введите номер задачи"
number=STDIN.gets.chomp
args = File.open("input.txt","r"){ |file| file.read }.split("\n")
	puts eval ("method_#{number}(#{args})")
