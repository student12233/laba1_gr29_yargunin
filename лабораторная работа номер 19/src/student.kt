import java.lang.Exception

class student constructor(_name:String, _sename:String, _data:String, _age:Int, _gender:Char, _motherLand:String, _group:Int, _namberCyrs:Int, _budget:Boolean ): peopleClass(_name,_sename,_data,_age,_gender,_motherLand) {

    var group: Int?
    var namberCyrs: Int
    var budget: Boolean

    init {
        budget = _budget
        group = _group
        if (_namberCyrs in 1..4)
            namberCyrs = _namberCyrs
        else
            throw  Exception("неправильный номер курса")
    }
}