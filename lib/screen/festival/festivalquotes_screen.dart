

import 'package:festival_app/screen/model/festival_model.dart';
import 'package:flutter/material.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  List<festivalModel> f1 = [];
  @override
  Widget build(BuildContext context) {
    f1 = ModalRoute.of(context)!.settings.arguments as List<festivalModel>;
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes"),
        backgroundColor: Colors.red.shade200,
      ),
      body: ListView.builder(
         itemCount:f1.length ,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
        return festeval(index);
      },),
    );
  }
Widget festeval(int index)
  {
    return  InkWell(onTap: () {
      Navigator.pushNamed(context, 'Festival',arguments: f1[index]);
    },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(20),
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.red.shade200,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),topRight: Radius.circular(40))
        ),
        child: Column(
          children: [
            Text("${f1[index].quotes}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)
          ],
        ),
      ),
    );
  }
}
