class Array
    def select
        newarr = []
        i = 0
        
        while i < self.length
            res = yield self[i]
            newarr << self[i] if res == true
            i += 1
        end

        newarr
    end

    def detect search
        vtfilter self do |item|
            return item if item == search
        end
    end

    def all?
        result = true
        i = 0
        
        while i < self.length 
            res = yield self[i]
            
            unless res
                return
            end
            
            result = res
            i += 1
        end

        result
    end

    def any?
        result = false
        i = 0
        
        while i < self.length
            res = yield self[i]
            
            if res == true
                return true
            end
            
            i += 1
        end

        result
    end

    def counts &block
        self.vtfilter(&block).length
    end

end

def sumOfPow *args
    arrWithoutMin = args - [args.min]
    
    arrWithoutMin[0]**2 + arrWithoutMin[1]**2
end

def fib n
    return n if n == 0 or n == 1
    fib(n - 1) + fib(n - 2)
end
