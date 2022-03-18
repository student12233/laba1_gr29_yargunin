require "yaml"




class Department
    include Comparable 
    public attr_accessor :name
    public attr_reader :number
    def initialize(name,number,duties=[])
        self.name= name
        self.number= number
        @duties=duties
        @duties_index_now=0
    end
    def number=(val)
      @number=val if Department.number?(val)
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
    def Department.number?(number)
      return /\+[0-9]{11}/.match?(number)
    end
    def duties_size()
      @duties.size()
    end
    def <=>(val)
      return 0 if self.name== val.name || self.number== val.number
      return 1 if self.duties_size() > val.duties_size()
      return -1
    end
    def as_hash 
      {
        "name"=> self.name,
        "number"=> self.number,
        "duties"=> @duties
      }
    end
end
class Department_list
  include Enumerable
  def initialize(departmens=[])
    @Department_list=departmens if Department_list.is_Departments?(departmens) || departmens.size==0
    self.Departments_cursor= nil
  end
  def Department_list.is_Departments?(val)
    c=true
    val.each{|x| c=false if !x.is_a?(Department)}
    return c
  end
  def each()
    for i in @Department_list do
      yield i
    end
  end
  def isempty?()
     @Department_list.size==0
  end
  def Departments_cursor=(val)
    @Department_cursor=@Department_list.find{|x|x.name==val} if !(self.isempty?)
  end
  def Departments_cursor()
    return @Department_cursor
  end
  def Departments_add(department)
    @Department_list.push(department) if !(@Department_list.include?(department))
  end
  def Department_cursor_delete()
    if !(self.duties_empty?) 
    @Department_list.delete(self.Department_cursor) 
    @Department_list =nil 
    end
  end
  def Department_read()
    sum=""
    self.each{|x| sum+=(x.to_s+"\n")}
    return sum
  end
  def Department_cursor_read()
    self.Departments_cursor.to_s
  end
  def Department_cursor_update(val)
    if  !@Department_list.include?(val)
      @Department_list[@Department_list.find_index{|x| x==Departments_cursor}]= val
      self.Departments_cursor= val
    end
  end
  def Department_list.import_from_txt(href)
    departments= File.open(href,"r"){|file| file.read}
    departments=departments.scan(/\{[0-9a-zA-Z+а-яА-Я:<>, ]+\}/)
    dep_list=[]
    departments.each do |x|   
      mass_el = x.scan(/\<[0-9а-яА-Яa-zA-Z,+ ]+\>/)
      name=mass_el[0][1...-1]
      numb=mass_el[1][1...-1]
      mass_duties=mass_el[2][1...-1].split(",")
      dep = Department.new(name,numb)
      mass_duties.each{|y| dep.duties_add(y)}
      dep_list.push(dep)
    end
    new(dep_list)
  end
  def export_from_txt(href)
      File.open(href, 'w'){ |file| file.write @Department_list.inject(""){|sum,x| sum+"{name:<#{x.name}> number:<#{x.number}> duties:<#{x.duties_read()}>}\n"}}
  end
  def to_s()
    self.Department_read()
  end
  def export_from_YAML(href)
    mass_dept=[]
    self.each{|x| mass_dept.push(x.as_hash)}
    File.open( href, 'w' ) do |out|
      YAML.dump( mass_dept, out )
    end
  end
  def Department_list.import_from_YAML(href)
    ya = YAML.load_file(href)
    mass_dept=[]
    ya.each do |x|
      name=x["name"]
      number=x["number"]
      duties=x["duties"]
      dep= Department.new(name,number,duties)
      mass_dept.push(dep)
    end
    new(mass_dept)
  end
end
number="+89181311793"
a=Department.new("A",number)
b=Department.new("A","+89181311794")
c=Department.new("Z","+89181311795")
deps = Department_list.new()
deps.Departments_add(a)
deps.Departments_add(b)
deps.Departments_add(c)
deps.Departments_cursor="A"
deps.export_from_txt("text.txt")
di = Department_list.import_from_txt("text.txt")
di.Departments_cursor= "Z"
di.export_from_YAML("ya.yaml")
ro =Department_list.import_from_YAML("ya.yaml")
puts(ro)

