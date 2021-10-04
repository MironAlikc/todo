import 'package:flutter/material.dart';
import 'package:todo/widgets/goups/goups_widget.dart';
import 'package:todo/widgets/group_form/group_form_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/groups': (context) => const GroupWidget(),
        '/groups/form': (context) => const GroupFormWidget(),
      },
      initialRoute: '/groups', // по умалчанию
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
