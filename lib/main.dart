import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {





  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future <List<String>> verileriGetir() async
  {
    var veriListesi = ["Almanya","Fransa","Polonya","Arjantin","Brezilya"];

    return veriListesi;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: FutureBuilder<List<String>>
        (
        future: verileriGetir(),
        builder: (context,snapshot) {
          if (snapshot.hasData) {
            var ulkelerListesi = snapshot.data;

            return ListView.builder(
                itemCount: ulkelerListesi!.length,
                itemBuilder: (context, index) {
                  var ulke = ulkelerListesi[index];
                  return Card(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 50,
                        child: Row(
                          children: [
                            Text("$ulke"),
                          ],
                        ),
                      ),
                    ),
                  );
                }

            );
          }
          else {
            return Center(
              child: Text("Veri alınamadı."),
            );
          }
        }
      ),

    );
  }
}
