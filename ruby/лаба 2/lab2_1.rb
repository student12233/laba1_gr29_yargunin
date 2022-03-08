class Department
    attr_accessor :name, :number
    def initialize(name,number)
        self.name= name
        self.number= number
    end
    def to_s
      return "название:#{self.name}  номер телефона:#{self.number}"
    end
end

