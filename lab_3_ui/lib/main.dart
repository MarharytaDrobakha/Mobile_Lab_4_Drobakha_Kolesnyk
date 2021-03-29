import 'package:flutter/material.dart';
import 'package:lab_3_ui/pages/chart.dart';
import 'package:lab_3_ui/pages/contracts.dart';
import 'package:lab_3_ui/pages/documentation.dart';
import 'package:lab_3_ui/pages/fileRead.dart';
import 'package:lab_3_ui/pages/home.dart';
import 'package:lab_3_ui/pages/powerUsage.dart';
import 'package:lab_3_ui/pages/powerUsageType.dart';
import 'package:lab_3_ui/pages/rates.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/powerUsage' : (context) => PowerUsage(),
      '/powerUsageType' : (context) => PowerUsageType(),
      '/chart' : (context) => ChartsDemo(),
      '/documentations' : (context) => Documentation(),
      '/contracts' : (context) => Contract(),
      '/fileRead' : (context) => FileRead(),
      '/rates' : (context) => Rates(),
    }
));
