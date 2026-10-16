import 'package:flutter/material.dart';

import '../tema.dart';

class EncabezadoInicio extends StatelessWidget {
  const EncabezadoInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          20, MediaQuery.of(context).padding.top + 16, 20, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF4A2E20), kCafe],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: kNaranja,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text('M',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'serif')),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mira Local',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'serif')),
                    Text('Descubre · Conoce · Elige',
                        style: TextStyle(color: kNaranja, fontSize: 11)),
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white38),
                  shape: const StadiumBorder(),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                ),
                child: const Text('Soy emprendedor',
                    style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
          const SizedBox(height: 28),
          const Text.rich(
            TextSpan(
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'serif',
                  height: 1.15),
              children: [
                TextSpan(text: 'Lo mejor de tu '),
                TextSpan(
                    text: 'barrio',
                    style: TextStyle(
                        color: kNaranja, fontStyle: FontStyle.italic)),
                TextSpan(text: ',\na un tap.'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Text('Descubre emprendimientos locales',
              style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 4, 6, 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.grey),
                const SizedBox(width: 8),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar emprendimientos...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    backgroundColor: kNaranja,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text('Buscar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
