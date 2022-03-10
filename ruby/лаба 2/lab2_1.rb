class Department
    public attr_accessor :name, :number
    def initialize(name,number)
        self.name= name
        self.number= number
        @duties=[]
        @duties_index_now=0
    end
    def duties_empty?()
      @duties.size==0
    end
    def to_s()
      return "название:#{self.name}  номер телефона:#{self.number}  обязанности:#{self.duties_read}"
    end
    def duties_add(dutie)
      @duties.push(dutie).uniq!()
    end
    def duties_read()
      sum=","
      @duties.each_with_index do |x,ind| 
        if(ind==@duties_index_now)
          sum+="{#{x}},"
        else
          sum+="#{x},"
        end
      end
      return sum
    end
    def duties_cursor(dutie)
      @duties_index_now = @duties.find_index(dutie) if @duties.find_index(dutie)!= nil
    end
    def duties_cursor_read()
      return @duties[duties_index_now].to_s if  !(self.duties_empty?) 
    end
    def duties_cursor_update(dutie)
      @duties[@duties_index_now]= dutie if !((@duties.include?(dutie)) & (self.duties_empty?))
    end
    def duties_cursor_delete()
      @duties.delete_at(@duties_index_now) if !(self.duties_empty?) 
      @duties_index_now=0
    end
end



a=Department.new("w","s")
puts(a)
a.duties_add("заняться бизнесом")
a.duties_add("отдыхать")
a.duties_add("z z z z")
puts(a.duties_read)
a.duties_cursor("отдыхать")
a.duties_cursor_update("пом пом")
puts(a.duties_read)
a.duties_cursor_delete
puts(a.duties_read)

