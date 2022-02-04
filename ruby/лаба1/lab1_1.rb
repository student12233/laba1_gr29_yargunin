
#задание1
=begin
	
это многострочный коментарий
	
=end

# а это однострочный коментарий


 puts ('#а это уже не коментарий')
 puts "hello world1"
 print "hello world2\n"
 #задание 2

 
 # выводим приветствие
 puts "добрый день #{ARGV[0]}"
# получаем методы класса String
 puts String.instance_methods


#задание 3
puts "какой язык програмированния вам больше нравится"
lang = STDIN.gets.chomp
x = if lang =="ruby" then puts "подлиза" else puts "а будет руби" end








