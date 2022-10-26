require_relative "employee.rb"

class Manager < Employee
    attr_reader :employees
    def initialize(name, title, salary, managers)
        super #(name, title, salary, managers)
        @employees = []
    end

    def add_employee(employee_name)
        if employee_name.managers == self.name
            @employees << employee_name
        end
    end

    def bonus(multiplier)
        total_salary = 0
        @employees.each do |employee|
            total_salary += employee.salary
        end
        bonus = (total_salary) * multiplier

    end

end