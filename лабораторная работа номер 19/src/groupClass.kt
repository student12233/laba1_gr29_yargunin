import java.lang.Exception

class groupClass(_number_group:Int, _teacher:TeacherClass, _cyrs:Int,napraw:String)
{
    val numberGroup:Int
    var teacher : TeacherClass?
    var listStudent:MutableList<student>
    val cyrs :Int
    val napraw:String

    init
    {
        this.napraw = napraw
        numberGroup = _number_group
        teacher = _teacher
        if(_cyrs in 1..4)
            cyrs =_cyrs
        else
            throw  Exception("невозможный номер курса")

        listStudent = mutableListOf()
    }
    constructor(_number_group:Int,_teacher:TeacherClass,_cyrs:Int,nap:String,_listStudent:MutableList<student>):this(_number_group,_teacher,_cyrs,nap)
    {
        listStudent = _listStudent
    }





    fun add_student()
    {
        print("введите имя")
        val name:String = readLine()!!
        print("введите фамилию")
        val sename: String = readLine()!!
        print("введите возраст")
        var age: Int = readLine()!!.toInt()
        print("введите дату рождения")
        val data :String = readLine()!!
        print("введите пол")
        val gender :Char = readLine()!![0]
        print("введите родину")
        val motherLand:String = readLine()!!
        print("бюджет")
        var budget: Boolean = readLine()!!.toBoolean()
        listStudent.add(student(name,sename,data,age,gender,motherLand,numberGroup,cyrs,budget))
    }
    fun addCurator()
    {
        print("введите имя")
        val name:String = readLine()!!
        print("введите фамилию")
        val sename: String = readLine()!!
        print("введите возраст")
        var age: Int = readLine()!!.toInt()
        print("введите дату рождения")
        val data :String = readLine()!!
        print("введите пол")
        val gender :Char = readLine()!![0]
        print("введите родину")
        val motherLand:String = readLine()!!
        print("введите предметы которые ведет  через запятую")
        var predmetss :String= readLine()!!
        var predmets:List<String> = predmetss.split(',')
        print("введите экзаменационный предмет")
        var examPredmet:String= readLine()!!
        teacher = TeacherClass(name,sename,data,age,gender,motherLand,numberGroup,predmets,examPredmet)
    }
    fun add_student(stud:student) = listStudent.add(stud)

    fun search_boo(stud:student) = search_boo(stud,0)

    tailrec fun search_boo(stud: student, count:Int):student?
    {

        return if (listStudent[count].equals(stud))
            return listStudent[count]
        else if (count + 1 == listStudent.size)
            return null
        else search_boo(stud, count + 1)
    }
    fun delete_student (stud:student) {
        this.search_boo(stud)?.group=null
        listStudent.remove(stud)
    }
    fun delete_curator()
    {
        teacher?.numberGroup=null
        teacher =null
    }


    override fun toString(): String = numberGroup.toString()
    override fun equals(other: Any?): Boolean = other is groupClass&&(this.numberGroup == other.numberGroup)
    override fun hashCode(): Int = (this.numberGroup+this.cyrs).hashCode()
}

