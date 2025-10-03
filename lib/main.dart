import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/ui/cubit/add_new_task_page_cubit.dart';
import 'package:to_do_app/ui/cubit/detail_page_cubit.dart';
import 'package:to_do_app/ui/cubit/main_page_cubit.dart';
import 'package:to_do_app/ui/cubit/updating_page_cubit.dart';
import 'package:to_do_app/ui/views/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainPageCubit()),
        BlocProvider(create: (context) => DetailPageCubit()),
        BlocProvider(create: (context) => AddNewTaskPageCubit()),
        BlocProvider(create: (context) => UpdatingPageCubit()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: MainPage(),
      ),
    );
  }
}

