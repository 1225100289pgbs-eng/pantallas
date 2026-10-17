import 'package:flutter/material.dart';

import 'modelos/categoria.dart';
import 'modelos/emprendimiento.dart';

void main() => runApp(const MiraLocalApp());

const naranja = Color(0xFFD95D39);
const crema = Color(0xFFFAF8F3);
const cafe = Color(0xFF2B1A12);

// ---------------------------------------------------------------------------
// Datos de ejemplo (solo para la vista)
// ---------------------------------------------------------------------------

const categorias = [
  Categoria(nombre: 'Comida', icono: Icons.restaurant, color: Color(0xFFFFEDE3)),
  Categoria(nombre: 'Postres', icono: Icons.cake, color: Color(0xFFFFE4EA)),
  Categoria(nombre: 'Ropa', icono: Icons.checkroom, color: Color(0xFFE6EEFF)),
  Categoria(nombre: 'Artesanías', icono: Icons.palette, color: Color(0xFFFFF4D6)),
  Categoria(nombre: 'Servicios', icono: Icons.build, color: Color(0xFFE3F4EC)),
  Categoria(nombre: 'Otros', icono: Icons.auto_awesome, color: Color(0xFFF1E6FF)),
];

const emprendimientos = [
  Emprendimiento(
    nombre: 'Dulces de la Abuela',
    categoria: 'Postres',
    zona: 'Centro Histórico',
    calificacion: 4.8,
    disponibilidad: true,
  ),
  Emprendimiento(
    nombre: 'La Mesa del Pueblo',
    categoria: 'Comida',
    zona: 'Barrio Sur',
    calificacion: 4.6,
    disponibilidad: true,
  ),
  Emprendimiento(
    nombre: 'Manos que Crean',
    categoria: 'Artesanías',
    zona: 'Villa Nueva',
    calificacion: 4.9,
    disponibilidad: false,
  ),
];

// ---------------------------------------------------------------------------
// App
// ---------------------------------------------------------------------------

class MiraLocalApp extends StatelessWidget {
  const MiraLocalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mira Local',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: naranja,
        scaffoldBackgroundColor: crema,
      ),
      home: const InicioPantalla(),
    );
  }
}

class InicioPantalla extends StatefulWidget {
  const InicioPantalla({super.key});

  @override
  State<InicioPantalla> createState() => _InicioPantallaState();
}

class _InicioPantallaState extends State<InicioPantalla> {
  int _pestana = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _encabezado(context),
          _tituloSeccion('Categorías', 'Ver todas'),
          _listaCategorias(),
          _tituloSeccion('Destacados', 'Ver todos'),
          for (final e in emprendimientos) _tarjeta(e),
          _botonExplorar(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _pestana,
        onDestinationSelected: (i) => setState(() => _pestana = i),
        backgroundColor: Colors.white,
        indicatorColor: Colors.transparent,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: naranja),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.grid_view_outlined),
            selectedIcon: Icon(Icons.grid_view, color: naranja),
            label: 'Categorías',
          ),
          NavigationDestination(
            icon: Icon(Icons.search),
            selectedIcon: Icon(Icons.search, color: naranja),
            label: 'Buscar',
          ),
        ],
      ),
    );
  }

  // Encabezado: logo, botón "Soy emprendedor", título y buscador con botón.
  Widget _encabezado(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          20, MediaQuery.of(context).padding.top + 16, 20, 24),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF4A2E20), cafe],
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
                  color: naranja,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'M',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'serif',
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Mira Local',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'serif',
                      ),
                    ),
                    Text(
                      'Descubre · Conoce · Elige',
                      style: TextStyle(color: naranja, fontSize: 11),
                    ),
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
                height: 1.15,
              ),
              children: [
                TextSpan(text: 'Lo mejor de tu '),
                TextSpan(
                  text: 'barrio',
                  style: TextStyle(color: naranja, fontStyle: FontStyle.italic),
                ),
                TextSpan(text: ',\na un tap.'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Descubre emprendimientos locales',
            style: TextStyle(color: Colors.white70),
          ),
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
                    backgroundColor: naranja,
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

  // Título de sección con su botón "Ver todas / Ver todos".
  Widget _tituloSeccion(String titulo, String accion) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 12, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titulo,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              accion,
              style: const TextStyle(
                color: naranja,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Lista horizontal de categorías: cada una es un botón con su ícono.
  Widget _listaCategorias() {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: categorias.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (_, i) {
          final c = categorias[i];
          return Material(
            color: c.color,
            borderRadius: BorderRadius.circular(18),
            child: InkWell(
              borderRadius: BorderRadius.circular(18),
              onTap: () {},
              child: SizedBox(
                width: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(c.icono, color: naranja),
                    const SizedBox(height: 6),
                    Text(
                      c.nombre,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Tarjeta de un emprendimiento destacado.
  // Sin fotos: se usa un bloque de color con el ícono de su categoría.
  Widget _tarjeta(Emprendimiento e) {
    final cat = categorias.firstWhere(
      (c) => c.nombre == e.categoria,
      orElse: () => categorias.last,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    color: cat.color,
                    child: Icon(cat.icono, size: 56, color: naranja),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: e.disponibilidad
                            ? const Color(0xFFE3F4EC)
                            : const Color(0xFFFFE4E4),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        e.disponibilidad ? 'Disponible' : 'No disponible',
                        style: TextStyle(
                          color: e.disponibilidad
                              ? const Color(0xFF2E7D5B)
                              : const Color(0xFFD32F2F),
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
                          Text(
                            e.nombre,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            '${e.categoria} · ${e.zona}',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      '${e.calificacion}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Botón grande al final de la lista.
  Widget _botonExplorar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
      child: FilledButton(
        onPressed: () {},
        style: FilledButton.styleFrom(
          backgroundColor: naranja,
          minimumSize: const Size.fromHeight(56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: const Text(
          'Explorar todos los emprendimientos →',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}