class Employee
    attr_reader :name, :title, :salary, :managers
    def initialize(name, title, salary, managers)
        @name = name 
        @title = title
        @salary = salary
        @managers = managers 
    end

    def bonus(multiplier)
        bonus = (salary) * multiplier
    end

    
end