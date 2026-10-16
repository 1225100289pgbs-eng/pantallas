import 'package:flutter/material.dart';

import '../modelos/emprendimiento.dart';

class TarjetaDestacado extends StatelessWidget {
  const TarjetaDestacado({super.key, required this.emprendimiento});

  final Emprendimiento emprendimiento;

  @override
  Widget build(BuildContext context) {
    final e = emprendimiento;
    final imagen = e.imagenPrincipal;

    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 16),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              // Sin foto se muestra un bloque de color; con foto, Image.asset.
              if (imagen == null)
                Container(
                  height: 180,
                  width: double.infinity,
                  color: const Color(0xFF8B3A2B),
                  child: const Icon(Icons.image_outlined,
                      size: 48, color: Colors.white54),
                )
              else
                Image.asset(imagen,
                    height: 180, width: double.infinity, fit: BoxFit.cover),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: e.disponibilidad
                        ? const Color(0xFFE3F4EC)
                        : const Color(0xFFEDEDED),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    e.disponibilidad ? 'Disponible' : 'No disponible',
                    style: TextStyle(
                      color: e.disponibilidad
                          ? const Color(0xFF2E7D5B)
                          : Colors.grey.shade700,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(e.nombre,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 2),
                      Text('${e.categoria} · ${e.zona}',
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                const Icon(Icons.star, color: Colors.amber, size: 18),
                const SizedBox(width: 4),
                Text('${e.calificacion}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
