import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/entity/to_do.dart';
import '../../data/repo/to_do_dao_repository.dart';

class DetailPageCubit extends Cubit<List<ToDo>> {
  DetailPageCubit() : super([]);
  ToDoRepoRepository toDoRepoRepository = ToDoRepoRepository();

    Future<void> fetchToDos() async {
      var todos = await toDoRepoRepository.fetchToDos();
      emit(todos);

}
}