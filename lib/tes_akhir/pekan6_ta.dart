import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TiketWisataApp(),
  ));
}

class HeaderWisata extends StatelessWidget {
  const HeaderWisata({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.indigo,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: const Column(
        children: [
          Icon(Icons.park, size: 48, color: Colors.white),
          SizedBox(height: 8),
          Text(
            'Taman Wisata Hutan Raya',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4),
          Text(
            'Buka: 07.00 - 17.00 WIB',
            style: TextStyle(fontSize: 15, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class TiketWisataApp extends StatefulWidget {
  const TiketWisataApp({super.key});

  @override
  State<TiketWisataApp> createState() => _TiketWisataAppState();
}

class _TiketWisataAppState extends State<TiketWisataApp> {
  int kuotaTersedia = 10;
  int pengunjungMasuk = 0;
  bool isGerbangTerkunci = false;

  void _tapMasuk() {
    setState(() {
      if (kuotaTersedia > 0 && !isGerbangTerkunci) {
        kuotaTersedia--;
        pengunjungMasuk++;
        if (kuotaTersedia == 0) {
          isGerbangTerkunci = true;
        }
      }
    });
  }

  void _toggleGerbang() {
    setState(() {
      isGerbangTerkunci = !isGerbangTerkunci;
    });
  }

  void _resetHarian() {
    setState(() {
      kuotaTersedia = 10;
      pengunjungMasuk = 0;
      isGerbangTerkunci = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistem Tiket Otomatis'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWisata(),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: isGerbangTerkunci ? Colors.red : Colors.green,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isGerbangTerkunci
                                  ? Icons.lock
                                  : Icons.lock_open,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              isGerbangTerkunci
                                  ? 'GERBANG TERKUNCI'
                                  : 'GERBANG DIBUKA',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _infoBox(
                            label: 'Sisa Kuota',
                            value: '$kuotaTersedia',
                            satuan: 'tiket',
                            warna: kuotaTersedia == 0
                                ? Colors.red
                                : Colors.indigo,
                          ),
                          Container(
                              width: 1, height: 60, color: Colors.grey[300]),
                          _infoBox(
                            label: 'Pengunjung Masuk',
                            value: '$pengunjungMasuk',
                            satuan: 'orang',
                            warna: Colors.indigo,
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: (kuotaTersedia > 0 && !isGerbangTerkunci)
                              ? _tapMasuk
                              : null,
                          icon: const Icon(Icons.confirmation_number),
                          label: const Text('Tap Masuk / Beli Tiket'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: _toggleGerbang,
                          icon: Icon(isGerbangTerkunci
                              ? Icons.lock_open
                              : Icons.lock),
                          label: Text(isGerbangTerkunci
                              ? 'Buka Gerbang Darurat'
                              : 'Kunci Gerbang Darurat'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isGerbangTerkunci
                                ? Colors.orange
                                : Colors.red,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: _resetHarian,
                          icon: const Icon(Icons.refresh),
                          label: const Text('Reset Kuota Harian'),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            textStyle: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoBox({
    required String label,
    required String value,
    required String satuan,
    required Color warna,
  }) {
    return Column(
      children: [
        Text(label,
            style: const TextStyle(fontSize: 13, color: Colors.grey)),
        Text(
          value,
          style: TextStyle(
            fontSize: 44,
            fontWeight: FontWeight.bold,
            color: warna,
          ),
        ),
        Text(satuan, style: const TextStyle(fontSize: 13, color: Colors.grey)),
      ],
    );
  }
}
