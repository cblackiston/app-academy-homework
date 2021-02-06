class Map
    def initialize
        @map = []
    end

    def set(key, value)
        @map << [key,value] if @map.none?{ |pair| pair.first == key }
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