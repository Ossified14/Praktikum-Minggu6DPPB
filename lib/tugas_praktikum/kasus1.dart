import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Kasus1CitizenCard(
      namaWarga: 'Asep Ridwan',
      nik: '3273012903990001',
      wilayah: 'Coblong, Kota Bandung',
    ),
  ));
}

class Kasus1CitizenCard extends StatelessWidget {
  final String namaWarga;
  final String nik;
  final String wilayah;

  const Kasus1CitizenCard({
    super.key,
    required this.namaWarga,
    required this.nik,
    required this.wilayah,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kasus 1: Kartu Warga Cerdas'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Card(
          elevation: 4,
          margin: const EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'KARTU IDENTITAS WARGA CERDAS',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.indigo,
                  ),
                ),
                const Divider(thickness: 1.5),
                const SizedBox(height: 10),
                Text('Nama Lengkap : $namaWarga'),
                Text('NIK          : $nik'),
                Text('Wilayah Dom. : $wilayah'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
