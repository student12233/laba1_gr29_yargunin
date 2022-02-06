

def method_len(mass)
return mass.sort{|x,y|x.size<=>y.size}
end

puts "введите номер задачи"
number=STDIN.gets.chomp
args = File.open("input.txt","r"){ |file| file.read }.split
	puts eval ("method_#{number}(#{args})")
