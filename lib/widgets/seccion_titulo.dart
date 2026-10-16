import 'package:flutter/material.dart';

import '../tema.dart';

class SeccionTitulo extends StatelessWidget {
  const SeccionTitulo(this.titulo, this.accion, {super.key});

  final String titulo;
  final String accion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titulo,
              style:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          Text(accion,
              style: const TextStyle(
                  color: kNaranja, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
