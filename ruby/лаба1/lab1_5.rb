def method_3(str)
return	str.split.shuffle.inject(""){|sum,x|sum+=(x+" ")}.strip!
end
def method_8(str)
	return str.split.select{|x| x.size%2==0}.size
end


