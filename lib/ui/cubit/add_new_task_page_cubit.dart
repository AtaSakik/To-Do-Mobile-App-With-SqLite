import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/entity/to_do.dart';
import '../../data/repo/to_do_dao_repository.dart';

class AddNewTaskPageCubit extends Cubit<List<ToDo>> {
  AddNewTaskPageCubit() : super([]);
  var toDoRepoRepository = ToDoRepoRepository();

  Future<void> addNewToDo(String title, String description) async {
    await toDoRepoRepository.insertToDo(title, description);
    var toDos = await toDoRepoRepository.fetchToDos();
    emit(toDos);

  }
}