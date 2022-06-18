import 'package:flutter/material.dart';

import 'model.dart';

class booksDetail extends StatelessWidget {

  Datum kitaplar;

  booksDetail({required this.kitaplar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        elevation: 0,
        title: Text("Detay"),
      ),
      body:Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height < 550 ? 165 : 250, //250
            width: MediaQuery.of(context).size.width < 340 ? 100 : 170, //170
            //margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade400, offset: const Offset(4, 4), blurRadius: 6),
                BoxShadow(color: Colors.grey.shade400, offset: const Offset(-4, -4), blurRadius: 5),
              ],
              image: DecorationImage(
                image: NetworkImage(kitaplar.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  height: MediaQuery.of(context).size.height < 550 ? 30 : 70,
                  width: MediaQuery.of(context).size.height < 340 ? 120 : 165,
                  child: MediaQuery.of(context).size.height < 550 ? FittedBox(
                    child: Text(
                      kitaplar.genre,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ) : Text(
                    kitaplar.author,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height < 550 ? 20 : 70,
                  width: MediaQuery.of(context).size.height < 340 ? 120 : 165,
                  child: MediaQuery.of(context).size.height < 550 ? FittedBox(
                    child: Text(
                      kitaplar.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ) : Text(
                    kitaplar.description,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue,
                    ),
                  ),),
                Container(
                  height: 2,
                  width: MediaQuery.of(context).size.width < 330 ? 145 : 175,
                  margin: const EdgeInsets.only(top: 5, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height < 550 ? 55 : 75,
                  width: MediaQuery.of(context).size.height < 340 ? 120 : 165,
                  child: MediaQuery.of(context).size.height < 550 ? Text(
                    kitaplar.isbn,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ) : Text(
                    kitaplar.publisher,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


/*
import 'package:flutter/material.dart';

void main() {
  runApp(const detailBooks());
}

class detailBooks extends StatelessWidget {
  const detailBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.grey.shade400,
      ),
      home: const MyHomePage(title: 'Detay Sayfası'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("Yapamadım",style: TextStyle(fontWeight: FontWeight.bold ),),
      ),
    );
  }
}
*/
