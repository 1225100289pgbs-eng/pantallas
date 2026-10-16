class Emprendimiento {
  final String nombre;
  final String categoria;
  final String zona;
  final double calificacion;
  final bool disponibilidad;
  final String? imagenPrincipal;

  const Emprendimiento({
    required this.nombre,
    required this.categoria,
    required this.zona,
    required this.calificacion,
    required this.disponibilidad,
    this.imagenPrincipal,
  });
}
