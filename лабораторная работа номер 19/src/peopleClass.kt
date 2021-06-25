abstract  class peopleClass( _name:String, _sename:String,_data:String,_age:Int,_gender:Char,_motherLand:String)
{


    val name:String
    val sename: String
    var age: Int
    val data :String
    val gender :Char
    val motherLand:String
    init {
        name= _name
        sename = _sename
        if(_age in 15..110)
            age = _age
        else
            throw   Exception("неправильная запись возраста")
        // if(validateData(_data))
        data = _data
        // else
        // throw   Exception("неправильная запись даты")

        if(_gender=='м'||_gender=='ж')
            gender = _gender
        else
            throw Exception("неправильная запись пола")
        motherLand=_motherLand





    }




    override fun toString(): String {
        return name+" "+sename;
    }

    override fun equals(other: Any?): Boolean
    {
        if(other!=null&& other is peopleClass)
        {

            return other.name ==this.name && other.sename == this.sename && other.age ==this.age
        }
        else
            return false
    }

    override fun hashCode(): Int {
        return name.hashCode()+sename.hashCode()-age
    }




}


