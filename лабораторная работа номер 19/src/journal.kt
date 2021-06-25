class journal(val napraw:String)
{
    var increm =0
    var spisok :List<date> = mutableListOf()
    data class date (val stud:student,val data:String,val end_ochenka:Int,val poitki:Int?,val predmet:String,val proffessor:TeacherClass,val id_zap:Int)
    {
        override fun equals(other: Any?): Boolean {
            return other is date && id_zap == other.id_zap
        }
    }
    fun add_zapic(stud: student,data:String,end_ochenka: Int,popitki: Int?,predmet: String,proffessor:TeacherClass)
    {
        val zap :date =date(stud,data,end_ochenka,popitki,predmet,proffessor,increm)
        spisok+=zap
        increm++
    }
    fun delete_zap_student(stud:student) {

        spisok=  spisok.filter { it.stud != stud }

    }



}