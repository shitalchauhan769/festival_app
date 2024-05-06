import 'package:flutter/material.dart';
import '../screen/festival/festivalquotes_screen.dart';

import '../screen/home/home_screen.dart';
import '../screen/quotes/festival_edting_screen.dart';
Map<String,WidgetBuilder>app_routs={
'/':(context) => Homescreen(),
  'Quotes':(context) => QuotesScreen(),
  'Festival':(context) => FestivalScreen(),
};