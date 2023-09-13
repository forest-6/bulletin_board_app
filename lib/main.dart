import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bowling',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: Image.asset('assets/images/bowling_logo.png',
          height: 50,
          fit: BoxFit.fill),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 130,
                margin: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue,
                ),
              ),
              Bulletins(title: '최신 게시글'),
              Bulletins(title: '인기 게시글'),
            ],
          )
        )
      ),
    );
  }
}

class BulletinInfos {
  int? id;
  String? title;
  String? content;
  int? up;
  int? down;
  String? date;
  String? time;

  BulletinInfos({
    this.id,
    this.title,
    this.content,
    this.up,
    this.down,
    this.date,
    this.time,
  });
}


// ignore: must_be_immutable
class Bulletins extends StatelessWidget {
  Bulletins({
    Key? key, this.title,
  }) : super(key: key);

  String? title;

  @override
  Widget build(BuildContext context) {

    Future<List<dynamic>> getBulletinsJson() async{
      final String response = await rootBundle.loadString('assets/json/bulletin.json');
      final data = json.decode(response);
      return data;
    }

    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$title',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )
            ),
            const Text('더보기 >',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Color(0xff2D8CFB),
              )
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffF0F0F0),
          ), 
          child:
        FutureBuilder<List<dynamic>>(future: getBulletinsJson(), builder: (context, snapshot){
          final List<dynamic>? bulletinInfos = snapshot.data;
          if (bulletinInfos != null) {
            return ListView.builder(
              itemCount: 4, 
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final bulletinInfo = bulletinInfos[index];

                return Container(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${bulletinInfo['title']}', 
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )
                            ),
                            Text('${bulletinInfo['date']} ${bulletinInfo['time']}',
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey
                              )
                            ),
                          ],
                        ),
                        const Text('10분전',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          )
                        )
                      ],
                    )
                  )
              );
              });
          }
          return Container(); 
        })
        )
      ],
    );
  }
}

