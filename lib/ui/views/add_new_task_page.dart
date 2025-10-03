import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/add_new_task_page_cubit.dart';

class AddNewTaskPage extends StatefulWidget {
  const AddNewTaskPage({super.key});

  @override
  State<AddNewTaskPage> createState() => _AddNewTaskPageState();
}

class _AddNewTaskPageState extends State<AddNewTaskPage> {
  var tfControllerTitle = TextEditingController();
  var tfControllerDescription = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Task",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
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
              onPressed: () {
                context.read<AddNewTaskPageCubit>().addNewToDo(tfControllerTitle.text, tfControllerDescription.text);

                Navigator.pop(context, {
                  'title': tfControllerTitle.text,
                  'description': tfControllerDescription.text
                });


                tfControllerTitle.clear();
                tfControllerDescription.clear();



              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
              ),
              child: const Text("Add Task",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
    );
  }
}
