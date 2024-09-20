import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// MyApp adalah widget utama yang menampilkan aplikasi Flutter
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Menampilkan halaman login
    );
  }
}

// LoginPage: Halaman untuk login
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Controller untuk menangkap input dari pengguna
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // Username dan password yang benar
  final String correctUsername = "user";
  final String correctPassword = "123";

  // Fungsi yang menjalankan aksi login
  void _login() {
    String username = _usernameController.text;
    String password = _passwordController.text;

    // Jika username dan password benar, pindah ke halaman menu
    if (username == correctUsername && password == correctPassword) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MenuPage()),
      );
    } else {
      // Jika salah, tampilkan pesan kesalahan
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Username atau Password salah')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")), // Judul halaman
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Pusatkan elemen di tengah
          children: <Widget>[
            // Input username
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.red)),
                  filled: true,
                  prefixIcon: Icon(Icons.person),
                  fillColor: Colors.grey[100]),
            ),
            // Input password
            SizedBox(
              height: 10,
            ),
            TextField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.red)),
                  filled: true,
                  prefixIcon: Icon(Icons.key),
                  fillColor: Colors.grey[100]),
            ), // Sembunyikan input password
            SizedBox(height: 20), // Jarak
            // Tombol login
            FilledButton(
              onPressed: _login,
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SampleCard extends StatelessWidget {
  const _SampleCard({required this.cardName});
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      child: Center(
        child:
            Text(cardName, style: TextStyle(color: Colors.black, fontSize: 20)),
      ),
    );
  }
}

// MenuPage: Halaman utama setelah login
class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu Utama")), // Judul halaman
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Pusatkan elemen di tengah
          children: <Widget>[
            // Tombol untuk membuka halaman list anggota kelompok
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GroupListPage()),
                );
              },
              child: _SampleCard(
                cardName: 'Anggota Kelompok',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            // Tombol untuk membuka halaman penjumlahan
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SumPage()),
                );
              },
              child: _SampleCard(cardName: 'Penjumlahan'),
            ),
            SizedBox(
              height: 15,
            ),
            // Tombol untuk membuka halaman pengurangan
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubtractionPage()),
                );
              },
              child: _SampleCard(cardName: 'Pengurangan'),
            ),
            SizedBox(
              height: 15,
            ),
            // Tombol untuk membuka halaman cek bilangan ganjil/genap
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GanjilGenapPage()),
                );
              },
              child: _SampleCard(cardName: 'Cek Bilangan Ganjil/Genap'),
            ),
          ],
        ),
      ),
    );
  }
}

// GroupListPage: Halaman untuk menampilkan anggota kelompok
class GroupListPage extends StatelessWidget {
  // Daftar anggota kelompok
  final List<Map<String, String>> members = [
    {"nama": "Arjunantaka SAS", "nim": "124220062"},
    {"nama": "Muhammad Haizuma", "nim": "124220084"},
    {"nama": "Wyldan Saharaputra", "nim": "124220115"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Anggota Kelompok")), // Judul halaman
      body: ListView.builder(
        itemCount: members.length, // Jumlah anggota
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Nama: ${members[index]['nama']}"), // Nama anggota
            subtitle: Text("NIM: ${members[index]['nim']}"), // NIM anggota
          );
        },
      ),
    );
  }
}

// SumPage: Halaman untuk penjumlahan
class SumPage extends StatefulWidget {
  @override
  _SumPageState createState() => _SumPageState();
}

class _SumPageState extends State<SumPage> {
  // Controller untuk menangkap input angka
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();
  String result = ""; // Variabel hasil

  // Fungsi penjumlahan
  void _calculateSum() {
    int num1 = int.tryParse(_number1Controller.text) ?? 0;
    int num2 = int.tryParse(_number2Controller.text) ?? 0;
    setState(() {
      result = "Hasil Penjumlahan: ${num1 + num2}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Penjumlahan")), // Judul halaman
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Pusatkan elemen
          children: <Widget>[
            // Input angka pertama
            TextField(
              controller: _number1Controller,
              decoration: InputDecoration(
                  labelText: 'Angka Pertama',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
              keyboardType: TextInputType.number, // Input hanya angka
            ),
            // Input angka kedua
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _number2Controller,
              decoration: InputDecoration(
                  labelText: 'Angka Kedua',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
              keyboardType: TextInputType.number, // Input hanya angka
            ),
            SizedBox(height: 20), // Jarak
            // Tombol untuk penjumlahan
            Center(
              child: IconButton(
                onPressed: _calculateSum,
                icon: Icon(Icons.add),
                iconSize: 55,
              ),
            ),
            SizedBox(height: 20), // Jarak
            // Menampilkan hasil
            Text(
              result,
              style: TextStyle(fontSize: 20, backgroundColor: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}

// SubtractionPage: Halaman untuk pengurangan
class SubtractionPage extends StatefulWidget {
  @override
  _SubtractionPageState createState() => _SubtractionPageState();
}

class _SubtractionPageState extends State<SubtractionPage> {
  // Controller untuk menangkap input angka
  final TextEditingController _number1Controller = TextEditingController();
  final TextEditingController _number2Controller = TextEditingController();
  String result = ""; // Variabel hasil

  // Fungsi pengurangan
  void _calculateSubtraction() {
    int num1 = int.tryParse(_number1Controller.text) ?? 0;
    int num2 = int.tryParse(_number2Controller.text) ?? 0;
    setState(() {
      result = "Hasil Pengurangan: ${num1 - num2}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pengurangan")), // Judul halaman
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Pusatkan elemen
          children: <Widget>[
            // Input angka pertama
            TextField(
              controller: _number1Controller,
              decoration: InputDecoration(
                  labelText: 'Angka Pertama',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
              keyboardType: TextInputType.number, // Input hanya angka
            ),
            SizedBox(
              height: 10,
            ),
            // Input angka kedua
            TextField(
              controller: _number2Controller,
              decoration: InputDecoration(
                  labelText: 'Angka Kedua',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
              keyboardType: TextInputType.number, // Input hanya angka
            ),
            SizedBox(height: 20), // Jarak
            // Tombol untuk pengurangan
            Center(
              child: IconButton(
                onPressed: _calculateSubtraction,
                icon: Icon(Icons.minimize),
                iconSize: 55,
              ),
            ),
            SizedBox(height: 20), // Jarak
            // Menampilkan hasil
            Text(
              result,
              style: TextStyle(fontSize: 20, backgroundColor: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}

// GanjilGenapPage: Halaman untuk mengecek bilangan ganjil atau genap
class GanjilGenapPage extends StatefulWidget {
  @override
  _GanjilGenapPageState createState() => _GanjilGenapPageState();
}

class _GanjilGenapPageState extends State<GanjilGenapPage> {
  // Controller untuk menangkap input angka
  final TextEditingController _numberController = TextEditingController();
  String result = ""; // Variabel hasil

  // Fungsi untuk mengecek ganjil/genap
  void _checkGanjilGenap() {
    int num = int.tryParse(_numberController.text) ?? 0;
    setState(() {
      if (num % 2 == 0) {
        result = "$num adalah Bilangan Genap";
      } else {
        result = "$num adalah Bilangan Ganjil";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cek Bilangan Ganjil/Genap")), // Judul halaman
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Pusatkan elemen
          children: <Widget>[
            // Input angka
            TextField(
              controller: _numberController,
              decoration: InputDecoration(
                  labelText: 'Masukkan Angka',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25))),
              keyboardType: TextInputType.number, // Input hanya angka
            ),
            SizedBox(height: 20), // Jarak
            // Tombol cek ganjil/genap
            ElevatedButton(
              onPressed: _checkGanjilGenap,
              child: Text('Cek Ganjil/Genap'),
            ),
            SizedBox(height: 20), // Jarak
            // Menampilkan hasil
            Text(
              result,
              style: TextStyle(fontSize: 20, backgroundColor: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}
