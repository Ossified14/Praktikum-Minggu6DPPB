import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Kasus3SmartPju(),
  ));
}

class Kasus3SmartPju extends StatefulWidget {
  const Kasus3SmartPju({super.key});

  @override
  State<Kasus3SmartPju> createState() => _Kasus3SmartPjuState();
}

class _Kasus3SmartPjuState extends State<Kasus3SmartPju> {
  bool _isLampuNyala = false;

  void _toggleSaklar() {
    setState(() {
      _isLampuNyala = !_isLampuNyala;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kasus 3: Saklar Smart PJU'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _isLampuNyala ? Icons.lightbulb : Icons.lightbulb_outline,
              size: 100,
              color: _isLampuNyala ? Colors.amber : Colors.grey,
            ),
            const SizedBox(height: 20),
            Text(
              _isLampuNyala ? 'Lampu Jalan: Menyala' : 'Lampu Jalan: Padam',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _toggleSaklar,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isLampuNyala ? Colors.redAccent : Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text(_isLampuNyala ? 'Matikan Lampu' : 'Nyalakan Lampu'),
            ),
          ],
        ),
      ),
    );
  }
}