import 'package:flutter/material.dart';

import '../tema.dart';

class SeccionTitulo extends StatelessWidget {
  const SeccionTitulo(this.titulo, this.accion, {super.key, this.onAccion});

  final String titulo;
  final String accion;
  final VoidCallback? onAccion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 12, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(titulo,
              style:
                  const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
          TextButton(
            onPressed: onAccion ?? () {},
            child: Text(accion,
                style: const TextStyle(
                    color: kNaranja, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}