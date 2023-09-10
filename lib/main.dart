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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
        ),
      ),
      
    );
  }
}

class Bulletins extends StatelessWidget {
  Bulletins({
    Key? key,
    this.title,
    this.content,
    this.date,
    this.time,
    this.up,
    this.down,
    this.addInfo,
  }) : super(key: key);

  String? title;
  String? content;
  String? date;
  String? time;
  String? up;
  String? down;
  String? addInfo;

  @override
  Widget build(BuildContext context) {
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffF0F0F0),
          ),
          child: const Column(
            children: [
              Bulletin(),
              Bulletin(),
              Bulletin(),
              Bulletin(),
            ],
          ),
        )
      ],
    );
  }
}

class Bulletin extends StatelessWidget {
  const Bulletin ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: const SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('테스트 게시글1', 
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  )
                ),
                Text('2023.09.10 10:00',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey
                  )
                ),
              ],
            ),
            Text('10분전',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              )
            )
          ],
        )
      )
    );
  }
}