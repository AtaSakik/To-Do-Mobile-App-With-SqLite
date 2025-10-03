import '../../sqlite/database_helper.dart';
import '../entity/to_do.dart';

class ToDoRepoRepository {



    Future<List<ToDo>> fetchToDos() async {
      var db= await DatabaseHelper.getDatabase();
      List<Map<String,dynamic>> maps= await db.query("to_do");
      return List.generate(maps.length, (i) {
        var row=maps[i];
        return ToDo(id: row["id"], title: row["title"], description: row["description"]);
      });
    }


    Future<void> insertToDo(String title, String description) async {
      var db= await DatabaseHelper.getDatabase();
      var newToDo=Map<String,dynamic>();
      newToDo["title"]=title;
      newToDo["description"]=description;
      await db.insert("to_do", newToDo);
    }




    Future<void> deleteToDo(int id) async {
      var db = await DatabaseHelper.getDatabase();
      await db.delete("to_do", where: "id = ?", whereArgs: [id]);
    }

    Future<void> updateToDo(int id,String title,String description) async {
      var db = await DatabaseHelper.getDatabase();
      var updatedToDo = <String, dynamic>{
        "title": title,
        "description": description,
      };
      await db.update("to_do", updatedToDo, where: "id = ?", whereArgs: [id]);

    }
}