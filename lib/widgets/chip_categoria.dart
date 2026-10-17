import 'package:flutter/material.dart';

import '../modelos/categoria.dart';
import '../tema.dart';

class ChipCategoria extends StatelessWidget {
  const ChipCategoria({super.key, required this.categoria, this.onTap});

  final Categoria categoria;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: categoria.color,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap ?? () {},
        child: SizedBox(
          width: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(categoria.icono, color: kNaranja),
              const SizedBox(height: 6),
              Text(categoria.nombre,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}