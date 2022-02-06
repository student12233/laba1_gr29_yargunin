def method_3(str)
return	str.split.shuffle.inject(""){|sum,x|sum+=(x+" ")}.strip!
end

print method_3 "1 2 3"
