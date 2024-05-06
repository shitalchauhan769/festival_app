import 'dart:math';

import 'package:flutter/material.dart';
import '../../until/globel.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  bool Isgrid = true;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                "festival Quteae",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              actions: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "grid",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "ist",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        )),
                  ],
                )
              ],
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red.shade200,
          title: Text("Festival Quotes"),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      Random r1 = Random();
                      int i = r1.nextInt(diwaliList.length);
                      return AlertDialog(
                        title: Text("${diwaliList[i].quotes}"),
                      );
                    },
                  );
                },
                icon: Icon(Icons.sunny)),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Isgrid = !Isgrid;
                  });
                },
                child: const Text(
                  "click",
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )),
          ],
        ),
        body: Isgrid
            ? GridView.builder(
                itemCount: catageriy.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Tile(index);
                },
              )
            : ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: catageriy.length,
                itemBuilder: (context, index) {
                  return Tile(index);
                },
              ),
      ),
    );
  }

  Widget Tile(int index) {
    return InkWell(
      onTap: () {
        List mainList = [
          diwaliList,
          makarsankrantiList,
          mahashivratriList,
          HoliList,
          ramnavamiList,
          ramdanediList,
          rakshabandhanList,
          janmashtamiList,
          ganeshchaturthiList,
          bakriediList,
          navratriList,
          dussehraList,
          muharramLsit
        ];

        Navigator.pushNamed(context, 'Quotes', arguments: mainList[index]);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage("${catageriy[index].image}"),
                fit: BoxFit.cover)),
        alignment: Alignment.bottomLeft,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text("${catageriy[index].name}",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              )),
        ),
      ),
    );
  }
}
