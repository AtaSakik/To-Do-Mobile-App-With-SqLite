import 'package:flutter/material.dart';
import 'package:to_do_app/ui/cubit/updating_page_cubit.dart';

import '../../data/entity/to_do.dart';
import '../../data/repo/to_do_dao_repository.dart';

class UpdatingPage extends StatefulWidget {
  ToDo toDo;
  UpdatingPage({super.key, required this.toDo});


  @override
  State<UpdatingPage> createState() => _UpdatingPageState();
}

class _UpdatingPageState extends State<UpdatingPage> {
  var tfControllerTitle = TextEditingController();
  var tfControllerDescription = TextEditingController();
  ToDoRepoRepository toDoRepoRepository = ToDoRepoRepository();

  @override
  void initState() {
    super.initState();
    tfControllerTitle.text = widget.toDo.title;
    tfControllerDescription.text = widget.toDo.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update To Do",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: tfControllerTitle,
              decoration: const InputDecoration(
                hintText: "Title",
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            TextField(
              controller: tfControllerDescription,
              decoration: const InputDecoration(
                hintText: "Description",
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await UpdatingPageCubit().updateToDo(widget.toDo.id, tfControllerTitle.text, tfControllerDescription.text);
                Navigator.pop(
                  context,
                  ToDo(
                    id: widget.toDo.id,
                    title: tfControllerTitle.text,
                    description: tfControllerDescription.text,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: const Text("Update", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            ),
          ],
        )
      )
    );
  }
}
