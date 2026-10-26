import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Kasus4PilihanLayanan(),
  ));
}

class Kasus4PilihanLayanan extends StatefulWidget {
  const Kasus4PilihanLayanan({super.key});

  @override
  State<Kasus4PilihanLayanan> createState() => _Kasus4PilihanLayananState();
}

class _Kasus4PilihanLayananState extends State<Kasus4PilihanLayanan> {
  String _layananTerpilih = 'Belum Ada Layanan Dipilih';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kasus 4: Pilihan Layanan Publik'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Silakan Pilih Layanan Loket:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: 250,
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _layananTerpilih = 'Layanan KTP Digital';
                    });
                  },
                  icon: const Icon(Icons.badge),
                  label: const Text('Layanan KTP Digital'),
                ),
              ),
              const SizedBox(height: 12),

              SizedBox(
                width: 250,
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      _layananTerpilih = 'Layanan Kartu Keluarga';
                    });
                  },
                  icon: const Icon(Icons.family_restroom),
                  label: const Text('Layanan Kartu Keluarga'),
                ),
              ),

              const Divider(height: 40),

              const Text(
                'Layanan Terpilih Saat Ini:',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                _layananTerpilih,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

