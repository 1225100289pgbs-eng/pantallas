import 'package:flutter/material.dart';

import '../modelos/categoria.dart';
import '../modelos/emprendimiento.dart';

// Datos de ejemplo, solo para que la vista se vea completa.
const categoriasEjemplo = [
  Categoria(nombre: 'Comida', icono: Icons.restaurant, color: Color(0xFFFFEDE3)),
  Categoria(nombre: 'Postres', icono: Icons.cake, color: Color(0xFFFFE4EA)),
  Categoria(nombre: 'Ropa', icono: Icons.checkroom, color: Color(0xFFE6EEFF)),
  Categoria(nombre: 'Artesanías', icono: Icons.palette, color: Color(0xFFFFF4D6)),
  Categoria(nombre: 'Servicios', icono: Icons.build, color: Color(0xFFE3F4EC)),
  Categoria(nombre: 'Otros', icono: Icons.auto_awesome, color: Color(0xFFF1E6FF)),
];

// Las imágenes son de ejemplo: cámbialas por las fotos de cada emprendimiento.
const emprendimientosEjemplo = [
  Emprendimiento(
    nombre: 'Dulces de la Abuela',
    categoria: 'Postres',
    zona: 'Centro Histórico',
    calificacion: 4.8,
    disponibilidad: true,
    imagenPrincipal: 'https://picsum.photos/seed/dulces/600/360',
  ),
  Emprendimiento(
    nombre: 'Pan de Casa',
    categoria: 'Comida',
    zona: 'Centro Histórico',
    calificacion: 4.6,
    disponibilidad: true,
    imagenPrincipal: 'https://picsum.photos/seed/pan/600/360',
  ),
  Emprendimiento(
    nombre: 'Artesanías Lupita',
    categoria: 'Artesanías',
    zona: 'Centro',
    calificacion: 4.5,
    disponibilidad: false,
    imagenPrincipal: 'https://picsum.photos/seed/artesanias/600/360',
  ),
];