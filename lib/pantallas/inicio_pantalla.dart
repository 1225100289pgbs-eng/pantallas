import 'package:flutter/material.dart';

import '../datos/datos_ejemplo.dart';
import '../tema.dart';
import '../widgets/chip_categoria.dart';
import '../widgets/encabezado_inicio.dart';
import '../widgets/seccion_titulo.dart';
import '../widgets/tarjeta_destacado.dart';

class InicioPantalla extends StatelessWidget {
  const InicioPantalla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const EncabezadoInicio(),
          const SeccionTitulo('Categorías', 'Ver todas'),
          SizedBox(
            height: 90,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: categoriasEjemplo.length,
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (_, i) =>
                  ChipCategoria(categoria: categoriasEjemplo[i]),
            ),
          ),
          const SeccionTitulo('Destacados', 'Ver todos'),
          for (final e in emprendimientosEjemplo)
            TarjetaDestacado(emprendimiento: e),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        backgroundColor: Colors.white,
        indicatorColor: Colors.transparent,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: kNaranja),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.grid_view_outlined),
            label: 'Categorías',
          ),
          NavigationDestination(icon: Icon(Icons.search), label: 'Buscar'),
        ],
      ),
    );
  }
}
