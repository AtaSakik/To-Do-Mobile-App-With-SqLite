import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/ui/views/add_new_task_page.dart';

import '../../data/entity/to_do.dart';
import '../cubit/add_new_task_page_cubit.dart';
import '../cubit/main_page_cubit.dart';
import 'detail_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    context.read<MainPageCubit>().fetchToDos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do List",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,

      ),
      body:  BlocBuilder<MainPageCubit, List<ToDo>>(
        builder: (context, toDos) {
          if (toDos.isEmpty) {
            return const Center(child: Text("No To Do Items",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),);
          }
          return ListView.builder(
            itemCount: toDos.length,
            itemBuilder: (context, index) {
              var toDo = toDos[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(toDo: toDo),)
                  ).then((value) => context.read<MainPageCubit>().fetchToDos());
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    title: Text(toDo.title,style: const TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(toDo.description),
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      child: Text((index + 1).toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),

                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Are you sure to delete "${toDo.title}" task? ')
                            ,action: SnackBarAction(label: 'Yes',onPressed: () async {
                            await context.read<MainPageCubit>().deleteToDo(toDo.id);
                          },
                          )
                          )
                        );

                      },
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add,color: Colors.white,),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewTaskPage(),)
          ).then((value) {
            if (value != null && value is Map<String, String>) {
              context.read<MainPageCubit>().fetchToDos();
            }
          });

        },

      ),
    );
  }
}
