class Item

    attr_accessor :title, :description, :deadline

    def self.valid_date?(date_string) # "2020-03-05"
        dates = date_string.split("-").map!(&:to_i) #
        return false unless dates[0] >= 2020
        return false unless dates[1] > 0 && dates[1] <= 12
        return false unless dates[2] > 0 && dates[2] <= 31
        true
    end

    def initialize(title, deadline, description)
        @title = title 
        @description = description
        if !Item.valid_date?(deadline)
            raise "Invalid date format. Please enter as 'YYYY-MM-DD'"
        else 
            @deadline = deadline
        end
    end

end