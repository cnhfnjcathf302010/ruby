def filter arr
	newarr = []

	arr.each do |item|
		res = yield item 

		newarr << item if res === true
	end
		
	newarr
end

v = filter([1,2,3,4]) do |item|
	item == 2
end

#p v

def find arr, search
	filter(arr) do |item|
		return item if item === search
	end
end

v = find([1,2,3,4], 2)

#p v

def every? arr
	result = true
	
	arr.each do |item|
		res = yield item
		
		unless res 
			return
		end
		
		result = res
	end
	
	result
end

v = every?([1, 3, 45]) do |item|
	item % 2 > 0
end

#p v

def some? arr 
	result = false
	
	arr.each do |item|
		res = yield item
		
		if res === true
			return true
		end
	end
	
	result
end

v = some?([1,4,6]) do |item|
	item % 2
end

#p v

def counts arr, &block
	filter(arr, &block).length
end

v = counts([1,2,3,4,5]) do |item|
	item % 2 > 0
end

#p v

def sumOfPow *args
	arrWithoutMin = args - [args.min]
	arrWithoutMin.inject(0) do |accum, item|
		accum += item*item
	end

	#arrWithoutMin[0]*arrWithoutMin[0] + arrWithoutMin[1]*arrWithoutMin[1]
end

v = sumOfPow(1,2,3)
#p v


def fibonacci index
	if index <= 1 
		return 1
	end
		
	index*fibonacchi(index - 1)
end

p fibonacchi(7)


