import 'package:flutter/material.dart';

import '../modelos/emprendimiento.dart';

class TarjetaDestacado extends StatelessWidget {
  const TarjetaDestacado({super.key, required this.emprendimiento, this.onTap});

  final Emprendimiento emprendimiento;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final e = emprendimiento;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: onTap ?? () {},
          child: Column(
            children: [
              Stack(
                children: [
                  _foto(e.imagenPrincipal),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
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
        ),
      ),
    );
  }

  // Foto del emprendimiento. Sin imagen (o si falla la descarga) muestra un bloque de color.
  Widget _foto(String? url) {
    final vacio = Container(
      height: 180,
      width: double.infinity,
      color: const Color(0xFF8B3A2B),
      child: const Icon(Icons.image_outlined, size: 48, color: Colors.white54),
    );
    if (url == null) return vacio;
    return Image.network(
      url,
      height: 180,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => vacio,
    );
  }
}