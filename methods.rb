class Array

    def select
        self.reduce [] do |accum, item|
            accum << item if yield item
            
            accum
        end
    end

    def detect search
        select self do |item|
            return item if item == search
        end
    end

    def all?
        self.reduce true do |accum, item|
            unless yield item 
                return
            end
            
            accum
        end
    end

    def any?
        self.reduce false do |accum, item|
            return true if yield item
            accum
        end
    end

    def counts &block
        self.select(&block).length
    end
    
    def flatten 
        self.reduce [] do |accum, item|
            if item.is_a? Array
                accum.concat flatten item
            else
                accum << item
            end
        end
    end
    
    def local_max 
        newarr = []
        
        self.each_with_index do |item, index|
            if index > 0 && item > self[index - 1] && self[index + 1] && item > self[index + 1]
                newarr << item
            end
        end
        
        newarr
    end
    
    def reverse 
        i = self.length - 1
        newarr = []     
        while i > -1
            newarr << self[i]
            i -= 1
        end
        
        newarr
    end
    
    def sort_by_even 
        self.sort do |first, second|
            if (second % 2 == 0)
                1
            else 
                -1
            end
        end
    end
    
    def sort_by_length
        self.sort do |first, second| 
            first.length <=> second.length
        end
    end
    
    def group_by_lastname
        result = {}
        
        self.each do |elem|
            lastname = elem['lastname']
            result[lastname] ||=[]
            result[lastname] << elem
        end
        
        result
    end
    
end

def merge main, added 
    newhash = {}
    add = proc do |key, value| 
        newhash[key] = value
    end
    
    added.each &add
    main.each &add  
        
    newhash
end

def sum_of_pow *args
    arrWithoutMin = args - [args.min]
    
    arrWithoutMin[0]**2 + arrWithoutMin[1]**2
end

def fib n
    return n if n == 0 or n == 1
    fib(n - 1) + fib(n - 2)
end
