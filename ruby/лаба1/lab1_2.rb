

def sum_chi(chi)
	return chislo=chi.to_s.chars.inject(0){|sum,x| sum + x.to_i }
end


def max_chi(chi)
	return chislo=chi.to_s.chars.max
end

def min_chi(chi)
	return chislo=chi.to_s.chars.min
end

def mult_chi(chi)
	return chislo=chi.to_s.chars.inject(1){|sum,x| sum * x.to_i }
end

