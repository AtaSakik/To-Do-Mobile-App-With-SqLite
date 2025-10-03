import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/entity/to_do.dart';
import '../../data/repo/to_do_dao_repository.dart';

class UpdatingPageCubit extends Cubit<List<ToDo>> {
  UpdatingPageCubit() : super([]);
  ToDoRepoRepository toDoRepoRepository = ToDoRepoRepository();

  Future<void> updateToDo(int id, String title, String description) async {
    await toDoRepoRepository.updateToDo(id, title, description);
    var todos = await toDoRepoRepository.fetchToDos();
    emit(todos);
  }
}