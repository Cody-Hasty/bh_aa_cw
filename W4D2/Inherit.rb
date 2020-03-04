class Employee
  attr_reader :name, :title, :salary
  def initialize(name, salary, title, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @boss.add_employees(self) unless @boss == nil
   
  end
  
  def bonus(multiplier)
    bonus = self.salary * multiplier
  end


  
  
end

class Manager < Employee
  attr_reader :employees
  def initialize(name, salary, title, boss = nil)
    super
    @employees = []
  end

  def add_employees(arg)
    self.employees << arg
  end

  def bonus(multiplier)
    sum = 0
    employees.each{|employee| sum += employee.salary}
    sum * multiplier
  end
end

ned = Manager.new("Ned", 1000000, "Founder")
darren = Manager.new("Darren", 78000, "TA Manager", ned)
shawna = Employee.new("Shawna", 12000, "TA", darren)
david = Employee.new("David", 10000, "TA", darren)
p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000