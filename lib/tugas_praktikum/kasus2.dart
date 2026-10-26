import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Kasus2PassengerCounter(),
  ));
}

class Kasus2PassengerCounter extends StatefulWidget {
  const Kasus2PassengerCounter({super.key});

  @override
  State<Kasus2PassengerCounter> createState() => _Kasus2PassengerCounterState();
}

class _Kasus2PassengerCounterState extends State<Kasus2PassengerCounter> {
  int _jumlahPenumpang = 0;
  final int _kapasitasMaksimal = 15;

  void _tambahPenumpang() {
    setState(() {
      if (_jumlahPenumpang < _kapasitasMaksimal) {
        _jumlahPenumpang++;
      }
    });
  }

  void _kurangPenumpang() {
    setState(() {
      if (_jumlahPenumpang > 0) {
        _jumlahPenumpang--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isPenuh = _jumlahPenumpang >= _kapasitasMaksimal;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kasus 2: Counter Okupansi Halte'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Okupansi Halte Smart BRT',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              '$_jumlahPenumpang / $_kapasitasMaksimal',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: isPenuh ? Colors.red : Colors.green,
              ),
            ),
            Text(
              isPenuh ? 'Status: HALTE PENUH' : 'Status: RUANG TERSEDIA',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isPenuh ? Colors.red : Colors.green,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _kurangPenumpang,
                  icon: const Icon(Icons.remove),
                  label: const Text('Keluar'),
                ),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: _tambahPenumpang,
                  icon: const Icon(Icons.add),
                  label: const Text('Masuk'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}