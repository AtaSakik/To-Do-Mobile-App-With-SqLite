import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/data/repo/to_do_dao_repository.dart';

import '../../data/entity/to_do.dart';


class MainPageCubit extends Cubit<List<ToDo>> {
  MainPageCubit() : super([]);
  ToDoRepoRepository toDoRepoRepository = ToDoRepoRepository();

  Future<void> fetchToDos() async {

    var todos = await toDoRepoRepository.fetchToDos();
    emit(todos);
  }
  Future<void> deleteToDo(int id) async {
    await toDoRepoRepository.deleteToDo(id);
    var todos = await toDoRepoRepository.fetchToDos();
    emit(todos);
  }
}