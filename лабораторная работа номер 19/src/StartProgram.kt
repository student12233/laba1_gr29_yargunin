import com.google.gson.Gson
import java.io.FileReader
import java.io.FileWriter
import java.io.File
import java.io.FileNotFoundException
import com.google.gson.JsonParser
import com.google.gson.JsonArray

// сериализует объект
fun<T> serializeObject(someObject: T): String = Gson().toJson(someObject)
// десериализует объект
inline fun<reified T> deserializeObject(jsonObject: String): T =
    try {
        Gson().fromJson(jsonObject, T::class.java)
    }
    catch(e: com.google.gson.JsonSyntaxException) {
        throw ClassCastException("Invalid type for deserialization")
    }
// сериализует список объектов и записывает в json файл
fun<T> writeToJson(fileName: String, jsonObjects: T) {
    if (!fileName.endsWith(".json"))
        throw IllegalArgumentException("$fileName isn't .json file")

    FileWriter(fileName).use { writer ->
        Gson().toJson(jsonObjects, writer) }
}
// читает список объектов из json файла и десериализует
inline fun<reified T> readFromJsonFile(fileName: String): List<T> {
    if (!fileName.endsWith(".json"))
        throw IllegalArgumentException("$fileName isn't .json file")

    if (!File(fileName).exists())
        throw FileNotFoundException("$fileName doesn't exist")

    val list: MutableList<T> = mutableListOf()
    FileReader(fileName).use { reader ->
        val gson = Gson()
        val array: JsonArray = JsonParser().parse(reader).asJsonArray
        for (jsonElement in array) {
            list.add(gson.fromJson(jsonElement, T::class.java))
        }
    }
    return list
}

fun main()
{
    val groups_st =  readFromJsonFile<groupClass>("json/groups.json")
    val proffesors = readFromJsonFile<TeacherClass>("json/professors.json")
    val jurnall = readFromJsonFile<journal>("json/journal.json")


    val prim1=jurnall[0].spisok.groupBy {it.stud}.filterNot {jurnall[0].spisok.filter{ it.end_ochenka == 3 || it.end_ochenka == 2 }.groupBy { it.stud }.contains(it.key)}.keys.filter { !it.budget }.filter { it.motherLand!="Россия" }.toString()
    val prim2 = ((jurnall[0].spisok.filter { it.stud.group ==29 }.filter { it.predmet == "дискретная математика"}.sumOf { it.end_ochenka }.toDouble())  /jurnall[0].spisok.filter { it.stud.group ==29 }.filter { it.predmet == "дискретная математика"}.count())
    val prim3 = jurnall[0].spisok.groupBy { it.end_ochenka }.filter { it.key==2 }.values.flatMap{it}.distinctBy { it.stud.name +it.stud.sename}.filter { it.poitki ==3 }.groupBy { it.stud }.keys.toString()
    val prim4 =jurnall[0].spisok.filter { groups_st.first{ it.teacher?.name=="Александр" &&it.teacher?.sename=="Климец" }.numberGroup==it.stud.group }.filter { it.end_ochenka==5&& it.predmet=="дискретная математика" }.groupBy { it.stud }.keys
    val prim5 = jurnall[0].spisok.filter { it.stud.budget==false&&it.stud.motherLand!="Россия" }.groupBy { it.stud }.maxByOrNull { it.value.sumOf { it.end_ochenka } }?.key.toString()

    print("иностранные студенты у которых есть шанс попасть на бюджет : ")
    println(prim1)
    print("средняя оценка 29 группы по дискретной математике :")
    println(prim2)
    print("студенты которые могут быть отчисленны : ")
    println(prim3)
    print("студенты из группы которую курирует Александр Климец и у которых по дискретной математике оценка 5 : ")
    println(prim4)
    print("иностранный студент на комерции у которого наибольший средний балл: ")
    println(prim5)




}