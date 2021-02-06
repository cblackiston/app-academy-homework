class Map
    def initialize
        @map = []
    end

    def set(key, value)
        matching_index = @map.index { |pair| pair.first == key }
        if matching_index
            @map[matching_index][1] = value
        else
            @map << [key,value]
        end
        value
    end

    def get(key)
        @map.each do |pair|
            return pair.last if pair.first == key
        end
    end

    def delete(key)
        @map.each do |pair|
            @map.delete(pair) if pair.first == key
        end
    end

    def show
        puts @map
    end

end