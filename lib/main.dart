import 'package:busonolsun/detaySayfa.dart';
import 'package:busonolsun/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFF151026)),
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Kitaplar'),
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
  
  final url = Uri.parse("https://fakerapi.it/api/v1/books?_quantity=100");
   int counter=0;
  var booksResult;
  Future callBooks() async{
    try{
      final response = await http.get(url);
      if(response.statusCode==200){
        var result = booksFromJson(response.body);
        print(result.data[0].author);
        print(result.data[0].title);
        print(result.data[0].image);
        print(result.data[0].genre);
        print(result.data[0].description);
        print(result.data[0].isbn);
        print(result.data[0].published);
        print(result.data[0].publisher);
        print(result.data[0].id);
        if(mounted)
          setState((){
            counter = result.data.length;
            booksResult = result;
          });
        return result;


      }else{
        print(response.statusCode);
      }
    }catch(e){
      print(e.toString());
    }
  }
  
  @override

  initState(){
    callBooks();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        elevation: 0,
        title: Align(alignment: Alignment.center,
            child: Text("Kitaplar")
        ),

      ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: ListView.builder(
              itemCount: counter,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>booksDetail(kitaplar: booksResult.data[index])));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Container(
                            height: MediaQuery.of(context).size.height < 550 ? 145 : 250, // 230
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.grey.shade400, offset: const Offset(4, 4), blurRadius: 6),
                                  BoxShadow(color: Colors.grey.shade400, offset: const Offset(-4, -4), blurRadius: 6),
                                ]
                            ),
                          ),
                        ),
                        Row(
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
                                  image: NetworkImage(booksResult.data[index].image),
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
                                        booksResult.data[index].title,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ) : Text(
                                      booksResult.data[index].author,
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
                                        booksResult.data[index].genre,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ) : Text(
                                      booksResult.data[index].description,
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
                                      booksResult.data[index].isbn,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.grey,
                                      ),
                                    ) : Text(
                                      booksResult.data[index].publisher,
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
                      ],
                    ),
                  ),
                );
              }
              ),
        ),
      ),
    );
  }
}
