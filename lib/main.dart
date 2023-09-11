import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_task/token/cash_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'core/di/di_container.dart';
import 'feature/app/app.dart';
// import 'features/app/presentation/pages/app.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();
  runApp( const App());
}

