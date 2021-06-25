class  TeacherClass constructor(_name:String, _sename:String, _data:String, _age:Int, _gender:Char, _motherLand:String,_num_group:Int?,_predmets:List<String>,kafedra:String): peopleClass(_name,_sename,_data,_age,_gender,_motherLand)
{
    var numberGroup :Int?
    var predmets :List<String>
    var kafedra:String
    init
    {
        numberGroup = _num_group
        predmets  = _predmets
        this.kafedra = kafedra
    }



}