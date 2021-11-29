import 'package:flutter/material.dart';
import 'package:myapp/add_data.dart';
import 'package:myapp/login_page.dart';
import 'package:myapp/put_del_data.dart';
import 'package:myapp/repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "EOS COST",
        theme: ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
        ),
        routes: {
          '/home': (context) => MyHomePage(
                title: 'EOS COST',
              ),
          '/add_data': (context) => AddData(),
          '/put_del_data': (context) => PutDelData(),
          '/login_page': (context) => LoginPage()
        },
        //Ganti fungsi home: untuk merubah awal dari aplikasi, misalnya menjadi home: MyHomePage()
        home: LoginPage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //variabel List dynamic ini dideklarasikan untuk membuat list dari hasil JSON pada fungsi getData()
  List<dynamic> listCostMaster = [];
  //untuk menggunakan fungsi yang ada di Repository.dart
  Repository repository = Repository();

  //Fungsi getData() ini memasukan variabel listCostMaster dengan data yang ada di JSON. SetState berfungsi untuk refresh halaman saat data sudah diterima
  getData() async {
    listCostMaster = await repository.getData();
    setState(() {});
  }
  //Initstate berfungsi untuk mengambil data terlebih dahulu sebelum aplikasi berjalan
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Abaikan Styling
    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.add_circle_sharp, color: Colors.white),
                //onPressed dibawah ini berfungsi untuk membuka halaman AddData saat di klik, yaitu tombol plus yang ada di navbar aplikasi
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(
                          builder: (context) => AddData()))
                      .whenComplete(() => getData());
                }),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      bottomNavigationBar: makeBottom,
      body: ListView.builder(
          itemBuilder: (context, index) {
            //GestureDetector yaitu mendeteksi klik pada list menu
            return GestureDetector(
              onTap: () => Navigator.of(context)
              //Pada saat di Klik, kita akan membawa data dibawah ini (Sesuai dengan hasil JSON) agar saat diedit datanya muncul
                  .pushNamed('/put_del_pelanggan', arguments: [
                listCostMaster[index].Document_ID,
                listCostMaster[index].Document_No,
                listCostMaster[index].Document_Date,
                listCostMaster[index].Cost_Name,
                listCostMaster[index].Cost_Source,
                listCostMaster[index].Division_Code,
                listCostMaster[index].Qty,
                listCostMaster[index].Unit,
                listCostMaster[index].Price,
                listCostMaster[index].Amount,
                listCostMaster[index].Image_01,
                listCostMaster[index].Image_02,
                listCostMaster[index].Image_03,
                listCostMaster[index].Remarks,
                listCostMaster[index].Fix_Cls,
                listCostMaster[index].Fix_Date,
                listCostMaster[index].Fix_User,
                listCostMaster[index].Update_Date,
                listCostMaster[index].Update_User,
                listCostMaster[index].Entry_Date,
                listCostMaster[index].Entry_User,
              ]).whenComplete(() => getData()),
              child: Card(
                elevation: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
                  child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      leading: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        decoration: BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    width: 1.0, color: Colors.white24))),
                        child: Icon(Icons.money, color: Colors.white),
                      ),
                      title: Text(
                        listCostMaster[index].Cost_Name,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          Text(listCostMaster[index].Cost_Source,
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                      trailing: IconButton(
                          onPressed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Hapus Data?'),
                                  content:
                                      const Text('Anda Yakin Ingin Menghapus Data Ini?'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Batal'),
                                      child: const Text('Batal'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        bool response = await repository
                                            .deleteData(listCostMaster[index]
                                                .Document_ID);
                                        if (response) {
                                          Navigator.pop(context, 'OK');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'Data Berhasil Dihapus!')));
                                        } else {
                                          Navigator.pop(context, 'Cancel');
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'Data Gagal Dihapus!')));
                                        }
                                        getData();
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              ),
                          icon: Icon(Icons.delete,
                              color: Colors.white, size: 30.0))),
                ),
              ),
            );
          },
          itemCount: listCostMaster.length),
    );
  }
}