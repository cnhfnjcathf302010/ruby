class Array

    def vtfilter
        newarr = []

        self.each do |item|
            res = yield item

            newarr << item if res == true
        end

        newarr
    end

    def vtfind search
        vtfilter self do |item|
            return item if item == search
        end
    end

    def vtevery?
        result = true

        self.each do |item|
            res = yield item

            unless res
                return
            end

            result = res
        end

        result
    end

    def vtsome?
        result = false

        self.each do |item|
            res = yield item

            if res == true
                return true
            end
        end

        result
    end

    def vtcounts &block
        self.vtfilter(&block).length
    end

end

def sumOfPow *args
    arrWithoutMin = args - [args.min]
    arrWithoutMin.inject(0) do |accum, item|
        accum += item**2
    end
end

def fibonacci index
    if index <= 1
        return 1
    end

    index*fibonacchi(index - 1)
end