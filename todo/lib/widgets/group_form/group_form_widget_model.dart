import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/domain/api_clients/entity/group.dart';

class GroupFormWidgetModel {
  var groupName = '';

  void seveGroup(BuildContext context) async {
    if (groupName.isEmpty) return; // если здесь пусто то мы ничего не делаем 
    if (!Hive.isAdapterRegistered(1)) { // группы сщхраняются 
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('goups_box');
    final group = Group(name: groupName);
    // unawaited(box.add(group));
    await box.add(group);
    Navigator.of(context).pop();// будем возврашатся обратно 
  }
}

class GroupFormWidgetModelProvider extends InheritedWidget {
  final GroupFormWidgetModel model;
  const GroupFormWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  static GroupFormWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GroupFormWidgetModelProvider>();
  }

  @override
  static GroupFormWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .dependOnInheritedWidgetOfExactType<GroupFormWidgetModelProvider>();
    //?.widget;
    return widget is GroupFormWidgetModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(GroupFormWidgetModelProvider oldWidget) {
    return true;
  }
}
