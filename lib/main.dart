import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/granths_screen.dart';
import 'screens/topics_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/detail_screens.dart';
import 'services/navigation_service.dart';

void main() {
  runApp(const GranthApp());
}

class GranthApp extends StatelessWidget {
  const GranthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'तत्व · Granth',
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.navigatorKey,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF5C1A1B),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F1E7),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF5C1A1B),
          foregroundColor: Color(0xFFF6F1E7),
          elevation: 0,
        ),
      ),
      onGenerateRoute: (settings) {
        final name = settings.name ?? '';
        if (name.startsWith('/granth/')) {
          final id = name.replaceFirst('/granth/', '');
          return MaterialPageRoute(builder: (_) => GranthDetailScreen(granthId: id));
        }
        if (name.startsWith('/topic/')) {
          final id = name.replaceFirst('/topic/', '');
          return MaterialPageRoute(builder: (_) => TopicDetailScreen(topicId: id));
        }
        return null;
      },
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  @override
  void initState() {
    super.initState();
    NavigationService.currentTab.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    NavigationService.currentTab.removeListener(_onTabChanged);
    super.dispose();
  }

  void _onTabChanged() {
    if (mounted) setState(() {});
  }

  final List<Widget> _pages = const [
    HomeScreen(),
    GranthsScreen(),
    TopicsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final index = NavigationService.currentTab.value;

    return Scaffold(
      body: IndexedStack(
        index: index,
        children: _pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => NavigationService.goToTab(i),
        backgroundColor: const Color(0xFF5C1A1B),
        indicatorColor: const Color(0xFFC47A2C),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: Color(0xFFF6F1E7)),
            selectedIcon: Icon(Icons.home, color: Color(0xFFF6F1E7)),
            label: 'होम',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined, color: Color(0xFFF6F1E7)),
            selectedIcon: Icon(Icons.menu_book, color: Color(0xFFF6F1E7)),
            label: 'ग्रंथ',
          ),
          NavigationDestination(
            icon: Icon(Icons.topic_outlined, color: Color(0xFFF6F1E7)),
            selectedIcon: Icon(Icons.topic, color: Color(0xFFF6F1E7)),
            label: 'टॉपिक',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline, color: Color(0xFFF6F1E7)),
            selectedIcon: Icon(Icons.person, color: Color(0xFFF6F1E7)),
            label: 'प्रोफाइल',
          ),
        ],
      ),
    );
  }
}
