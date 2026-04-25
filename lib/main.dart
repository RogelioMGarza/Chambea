import 'package:flutter/material.dart';

void main() {
  runApp(const ChambApp());
}

// ── Theme ────────────────────────────────────────────────────────────────────
const _primary = Color(0xFF6C3CE1);   // purple – brand
const _accent  = Color(0xFF00C896);   // teal – success / money
const _bg      = Color(0xFFF5F4FA);
const _card    = Colors.white;
const _text1   = Color(0xFF1A1A2E);
const _text2   = Color(0xFF6B6B8A);

class ChambApp extends StatelessWidget {
  const ChambApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chambea',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: _primary),
        scaffoldBackgroundColor: _bg,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const MainShell(),
    );
  }
}

// ── Shell with bottom nav ────────────────────────────────────────────────────
class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _idx = 0;
  final _pages = const [JobFeedScreen(), ProfileScreen(), WalletScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_idx],
      bottomNavigationBar: NavigationBar(
        backgroundColor: _card,
        indicatorColor: _primary.withOpacity(0.12),
        selectedIndex: _idx,
        onDestinationSelected: (i) => setState(() => _idx = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.work_outline),
            selectedIcon: Icon(Icons.work, color: _primary),
            label: 'Chambeas',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person, color: _primary),
            label: 'Perfil',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_wallet_outlined),
            selectedIcon: Icon(Icons.account_balance_wallet, color: _primary),
            label: 'Cartera',
          ),
        ],
      ),
    );
  }
}

// ── Shared widgets ───────────────────────────────────────────────────────────
class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  const _AppBar(this.title, {this.actions});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: _card,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Chambea',
              style: const TextStyle(
                color: _primary,
                fontWeight: FontWeight.w800,
                fontSize: 22,
                letterSpacing: -0.5,
              ),
            ),
            TextSpan(
              text: ' · $title',
              style: const TextStyle(
                color: _text2,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      actions: actions,
    );
  }
}

SliverToBoxAdapter _sectionHeader(String text) => SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 10),
        child: Text(text,
            style: const TextStyle(
                color: _text2, fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 0.8)),
      ),
    );

// ── 1. JOB FEED ──────────────────────────────────────────────────────────────
const _jobs = [
  {
    'title': 'Limpieza del hogar',
    'category': 'Hogar',
    'location': 'Coyoacán, CDMX',
    'price': '\$350',
    'priceDetail': 'por visita',
    'time': 'Hoy · 4 hrs',
    'type': 'Eventual',
    'icon': Icons.cleaning_services,
    'color': Color(0xFFE8F5E9),
    'iconColor': Color(0xFF2E7D32),
    'urgent': true,
  },
  {
    'title': 'Empleada del hogar',
    'category': 'Hogar',
    'location': 'Polanco, CDMX',
    'price': '\$1,800',
    'priceDetail': 'por semana',
    'time': 'Lun–Vie · Tiempo completo',
    'type': 'Largo plazo',
    'icon': Icons.home,
    'color': Color(0xFFE8F5E9),
    'iconColor': Color(0xFF2E7D32),
    'urgent': false,
  },
  {
    'title': 'Jardinería semanal',
    'category': 'Exterior',
    'location': 'Tlalpan, CDMX',
    'price': '\$1,200',
    'priceDetail': 'por semana',
    'time': 'Cada sábado · 6 hrs',
    'type': 'Largo plazo',
    'icon': Icons.yard,
    'color': Color(0xFFF3E5F5),
    'iconColor': Color(0xFF6A1B9A),
    'urgent': false,
  },
  {
    'title': 'Albañilería – reparación',
    'category': 'Construcción',
    'location': 'Iztapalapa, CDMX',
    'price': '\$800',
    'priceDetail': 'por día',
    'time': 'Sáb · Todo el día',
    'type': 'Eventual',
    'icon': Icons.handyman,
    'color': Color(0xFFFFF3E0),
    'iconColor': Color(0xFFE65100),
    'urgent': true,
  },
  {
    'title': 'Vigilante nocturno',
    'category': 'Seguridad',
    'location': 'Naucalpan, Edo. Mex',
    'price': '\$5,500',
    'priceDetail': 'por mes',
    'time': 'Lun–Sáb · Nocturno',
    'type': 'Largo plazo',
    'icon': Icons.security,
    'color': Color(0xFFE3F2FD),
    'iconColor': Color(0xFF1565C0),
    'urgent': false,
  },
  {
    'title': 'Cuidado de adulto mayor',
    'category': 'Cuidados',
    'location': 'Azcapotzalco, CDMX',
    'price': '\$4,800',
    'priceDetail': 'por mes',
    'time': 'Lun–Vie · Tiempo completo',
    'type': 'Largo plazo',
    'icon': Icons.favorite,
    'color': Color(0xFFFCE4EC),
    'iconColor': Color(0xFFC62828),
    'urgent': false,
  },
  {
    'title': 'Pintura de interiores',
    'category': 'Construcción',
    'location': 'Benito Juárez, CDMX',
    'price': '\$1,200',
    'priceDetail': 'por día',
    'time': 'Dom · 2 días',
    'type': 'Eventual',
    'icon': Icons.format_paint,
    'color': Color(0xFFE8EAF6),
    'iconColor': Color(0xFF283593),
    'urgent': false,
  },
];

class JobFeedScreen extends StatelessWidget {
  const JobFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      appBar: _AppBar('Chambeas', actions: [
        IconButton(
          icon: const Icon(Icons.tune, color: _text2),
          onPressed: () {},
        ),
        const SizedBox(width: 4),
      ]),
      body: CustomScrollView(
        slivers: [
          // Search bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Container(
                decoration: BoxDecoration(
                  color: _card,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Busca: limpieza, jardinería, obra...',
                    hintStyle: TextStyle(color: _text2, fontSize: 14),
                    prefixIcon: Icon(Icons.search, color: _text2),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),
          ),

          // Category chips
          SliverToBoxAdapter(
            child: SizedBox(
              height: 56,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                scrollDirection: Axis.horizontal,
                children: ['Todos', 'Hogar', 'Construcción', 'Exterior', 'Cuidados', 'Seguridad', 'Otro']
                    .asMap()
                    .entries
                    .map((e) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: FilterChip(
                            label: Text(e.value,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: e.key == 0 ? Colors.white : _text1,
                                  fontWeight: e.key == 0 ? FontWeight.w600 : FontWeight.w400,
                                )),
                            selected: e.key == 0,
                            selectedColor: _primary,
                            backgroundColor: _card,
                            side: BorderSide(color: Colors.grey.shade200),
                            onSelected: (_) {},
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),

          _sectionHeader('DISPONIBLES CERCA DE TI'),

          // Job cards
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (ctx, i) => _JobCard(job: _jobs[i]),
                childCount: _jobs.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),

    );
  }
}

class _JobCard extends StatelessWidget {
  final Map<String, dynamic> job;
  const _JobCard({required this.job});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => _showJobDetail(context, job),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Icon bubble
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: job['color'] as Color,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(job['icon'] as IconData,
                    color: job['iconColor'] as Color, size: 26),
              ),
              const SizedBox(width: 14),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(job['title']! as String,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                  color: _text1)),
                        ),
                        if (job['urgent'] == true)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFF3E0),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text('Urgente',
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Color(0xFFE65100),
                                    fontWeight: FontWeight.w600)),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 13, color: _text2),
                        const SizedBox(width: 2),
                        Text(job['location']! as String,
                            style: const TextStyle(fontSize: 12, color: _text2)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Text(job['price']! as String,
                            style: const TextStyle(
                                color: _accent,
                                fontWeight: FontWeight.w800,
                                fontSize: 16)),
                        const SizedBox(width: 4),
                        Text(job['priceDetail']! as String,
                            style: const TextStyle(fontSize: 11, color: _text2)),
                        const Spacer(),
                        if ((job['type'] as String) == 'Largo plazo')
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE3F2FD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text('Largo plazo',
                                style: TextStyle(fontSize: 10, color: Color(0xFF1565C0), fontWeight: FontWeight.w600)),
                          ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(job['time']! as String,
                        style: const TextStyle(fontSize: 11, color: _text2)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: _text2),
            ],
          ),
        ),
      ),
    );
  }

  void _showJobDetail(BuildContext context, Map<String, dynamic> job) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _JobDetailSheet(job: job),
    );
  }
}

class _JobDetailSheet extends StatelessWidget {
  final Map<String, dynamic> job;
  const _JobDetailSheet({required this.job});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      maxChildSize: 0.92,
      builder: (_, ctrl) => Container(
        decoration: const BoxDecoration(
          color: _card,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: ListView(
          controller: ctrl,
          padding: const EdgeInsets.all(24),
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2)),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: job['color'] as Color,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(job['icon'] as IconData,
                      color: job['iconColor'] as Color, size: 30),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(job['title']! as String,
                          style: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              color: _text1)),
                      Text(job['category']! as String,
                          style: const TextStyle(color: _text2, fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _detailRow(Icons.attach_money, 'Pago', '${job['price']} ${job['priceDetail']}',
                color: _accent),
            _detailRow(Icons.access_time, 'Horario', job['time']! as String),
            _detailRow(
                Icons.location_on, 'Ubicación', job['location']! as String),
            _detailRow(Icons.person, 'Publicado por', 'María G.'),
            const SizedBox(height: 20),
            const Text('Descripción',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: _text1)),
            const SizedBox(height: 8),
            const Text(
              'Se requiere persona de confianza para realizar la tarea. Se paga al finalizar el trabajo directamente por la app. El pago está garantizado por Chambea..',
              style: TextStyle(color: _text2, height: 1.6, fontSize: 14),
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text('Aplicar a este trabajo',
                    style:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(IconData icon, String label, String value,
      {Color? color}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color ?? _primary),
          const SizedBox(width: 12),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label,
                style: const TextStyle(
                    fontSize: 11, color: _text2, fontWeight: FontWeight.w500)),
            Text(value,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: color ?? _text1)),
          ]),
        ],
      ),
    );
  }
}

// ── 2. PROFILE ───────────────────────────────────────────────────────────────
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      appBar: _AppBar('Mi perfil', actions: [
        IconButton(
            icon: const Icon(Icons.edit_outlined, color: _text2),
            onPressed: () {}),
      ]),
      body: CustomScrollView(
        slivers: [
          // Profile header
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: _card,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: _primary.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 42,
                        backgroundColor: _primary.withOpacity(0.12),
                        child: const Icon(Icons.person,
                            size: 48, color: _primary),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                              color: _accent, shape: BoxShape.circle),
                          child: const Icon(Icons.check,
                              size: 14, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text('Carlos Mendoza',
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: _text1)),
                  const SizedBox(height: 4),
                  const Text('Albañil · Pintor · Reparaciones generales',
                      style: TextStyle(color: _text2, fontSize: 13),
                      textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _statBubble('4.9 ★', 'Calificación'),
                      _divider(),
                      _statBubble('47', 'Chambeas'),
                      _divider(),
                      _statBubble('98%', 'Completadas'),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Verified badges
          _sectionHeader('VERIFICACIONES'),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _badge(Icons.badge, 'INE verificado', true),
                  _badge(Icons.phone_android, 'Teléfono', true),
                  _badge(Icons.account_balance, 'Cuenta bancaria', true),
                  _badge(Icons.star, 'Trabajador top', false),
                ],
              ),
            ),
          ),

          // Skills
          _sectionHeader('HABILIDADES'),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  'Albañilería',
                  'Pintura',
                  'Plomería básica',
                  'Electricidad',
                  'Azulejo',
                  'Tablaroca',
                ].map((s) => Chip(
                      label: Text(s,
                          style: const TextStyle(
                              fontSize: 13, color: _primary)),
                      backgroundColor: _primary.withOpacity(0.08),
                      side: BorderSide.none,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                    )).toList(),
              ),
            ),
          ),

          // Recent reviews
          _sectionHeader('RESEÑAS RECIENTES'),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _ReviewCard(
                    name: 'Sofía R.',
                    stars: 5,
                    text: 'Excelente trabajo, muy puntual y limpio. Lo recomiendo al 100%.'),
                _ReviewCard(
                    name: 'Roberto V.',
                    stars: 5,
                    text: 'Pintó toda la casa en dos días. Muy profesional.'),
              ]),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }

  Widget _statBubble(String value, String label) => Column(
        children: [
          Text(value,
              style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                  color: _primary)),
          const SizedBox(height: 2),
          Text(label,
              style: const TextStyle(color: _text2, fontSize: 11)),
        ],
      );

  Widget _divider() => Container(
      width: 1, height: 32, color: Colors.grey.shade200);

  Widget _badge(IconData icon, String label, bool verified) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: verified
              ? _accent.withOpacity(0.1)
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: verified ? _accent.withOpacity(0.4) : Colors.grey.shade300,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                size: 14,
                color: verified ? _accent : _text2),
            const SizedBox(width: 6),
            Text(label,
                style: TextStyle(
                    fontSize: 12,
                    color: verified ? _accent : _text2,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      );
}

class _ReviewCard extends StatelessWidget {
  final String name, text;
  final int stars;
  const _ReviewCard(
      {required this.name, required this.stars, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: _primary.withOpacity(0.1),
              child: Text(name[0],
                  style: const TextStyle(
                      color: _primary, fontWeight: FontWeight.w700)),
            ),
            const SizedBox(width: 10),
            Text(name,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: _text1)),
            const Spacer(),
            Row(
              children: List.generate(
                  stars,
                  (_) => const Icon(Icons.star,
                      size: 14, color: Color(0xFFFFC107))),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(text,
            style: const TextStyle(color: _text2, fontSize: 13, height: 1.5)),
      ]),
    );
  }
}

// ── 3. WALLET ────────────────────────────────────────────────────────────────
const _txns = [
  {
    'desc': 'Limpieza – María G.',
    'amount': '+\$350',
    'date': 'Hoy',
    'positive': true,
    'icon': Icons.cleaning_services,
  },
  {
    'desc': 'Retiro a BBVA',
    'amount': '-\$500',
    'date': 'Ayer',
    'positive': false,
    'icon': Icons.account_balance,
  },
  {
    'desc': 'Pintura – Roberto V.',
    'amount': '+\$1,200',
    'date': 'Lun 8 abr',
    'positive': true,
    'icon': Icons.format_paint,
  },
  {
    'desc': 'Jardinería – Ana P.',
    'amount': '+\$500',
    'date': 'Vie 5 abr',
    'positive': true,
    'icon': Icons.yard,
  },
  {
    'desc': 'Retiro a Mercado Pago',
    'amount': '-\$800',
    'date': 'Mié 3 abr',
    'positive': false,
    'icon': Icons.send,
  },
];

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bg,
      appBar: _AppBar('Cartera'),
      body: CustomScrollView(
        slivers: [
          // Balance card
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6C3CE1), Color(0xFF9C6FE4)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.account_balance_wallet,
                          color: Colors.white70, size: 18),
                      SizedBox(width: 8),
                      Text('Saldo disponible',
                          style: TextStyle(
                              color: Colors.white70, fontSize: 13)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text('\$1,550',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -1)),
                  const SizedBox(height: 4),
                  const Text('MXN',
                      style: TextStyle(
                          color: Colors.white60, fontSize: 14)),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      _walletAction(Icons.arrow_upward, 'Retirar'),
                      const SizedBox(width: 12),
                      _walletAction(Icons.arrow_downward, 'Agregar'),
                      const SizedBox(width: 12),
                      _walletAction(Icons.share, 'Compartir'),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Payment methods
          _sectionHeader('MÉTODOS DE PAGO VINCULADOS'),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 90,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                scrollDirection: Axis.horizontal,
                children: [
                  _payMethod('BBVA', Icons.credit_card,
                      const Color(0xFF004A97)),
                  _payMethod('Mercado\nPago', Icons.account_balance_wallet,
                      const Color(0xFF009EE3)),
                  _payMethod('OXXO\nPay', Icons.store,
                      const Color(0xFFE21B25)),
                  _payMethod('+ Agregar', Icons.add,
                      _primary),
                ],
              ),
            ),
          ),

          // Transactions
          _sectionHeader('MOVIMIENTOS RECIENTES'),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, i) => _TxnRow(txn: _txns[i]),
                childCount: _txns.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 24)),
        ],
      ),
    );
  }

  Widget _walletAction(IconData icon, String label) => Expanded(
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Icon(icon, color: Colors.white, size: 20),
                const SizedBox(height: 4),
                Text(label,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ),
      );

  Widget _payMethod(String name, IconData icon, Color color) => Container(
        width: 80,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: _card,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 6),
            Text(name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: _text2)),
          ],
        ),
      );
}

class _TxnRow extends StatelessWidget {
  final Map<String, dynamic> txn;
  const _TxnRow({required this.txn});

  @override
  Widget build(BuildContext context) {
    final positive = txn['positive'] as bool;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: _card,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: positive
                  ? _accent.withOpacity(0.1)
                  : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(txn['icon'] as IconData,
                size: 20, color: positive ? _accent : _text2),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(txn['desc']! as String,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: _text1)),
                const SizedBox(height: 2),
                Text(txn['date']! as String,
                    style: const TextStyle(color: _text2, fontSize: 12)),
              ],
            ),
          ),
          Text(txn['amount']! as String,
              style: TextStyle(
                  color: positive ? _accent : _text1,
                  fontWeight: FontWeight.w800,
                  fontSize: 16)),
        ],
      ),
    );
  }
}
