import 'package:flutter/material.dart';

import '../modelos/categoria.dart';
import '../tema.dart';

class ChipCategoria extends StatelessWidget {
  const ChipCategoria({super.key, required this.categoria});

  final Categoria categoria;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      decoration: BoxDecoration(
        color: categoria.color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(categoria.icono, color: kNaranja),
          const SizedBox(height: 6),
          Text(categoria.nombre,
              style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
