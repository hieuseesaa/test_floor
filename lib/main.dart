import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_test/database/dao/user_dao.dart';
import 'package:flutter_app_test/get_it/service_locator.dart';
import 'package:flutter_app_test/module/user.dart';
import 'package:flutter_app_test/repository/user_repository.dart';

void main() async {
  runZoned<Future<void>>(
    () async {
      injectable();
      return runApp(MyApp());
    },
  );
}

void injectable() async {
  await ServiceLocator.initCommon();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  User _user = User.init();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'User info:',
            ),
            Text(
              'ID:  ${_user.id}',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              'Name: ${_user.name}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getUser,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _getUser() async {
    UserRepository repository = sl.get();
    UserDAO userDAO = sl.get<UserDAO>();
    final user = repository.getUser();
    userDAO.insertUser(user.toUserEntity());
    setState(() {
      _user = user;
    });
    final list = await userDAO.getAllCondition();
    print("AAAAAA ======> ${list.length}");
  }
}
