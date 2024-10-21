import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthviz/screens/home.dart';
import 'package:healthviz/screens/logs/logs_tab.dart';
import 'package:healthviz/screens/reminder.dart';
import 'package:healthviz/screens/visualization.dart';
import 'package:healthviz/widgets/common/custom_heading.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  String _activeScreenName = "";
  Widget _activeScreen = const HomeScreen();

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (_selectedPageIndex) {
      case 0:
        _activeScreen = const HomeScreen();
        _activeScreenName = "Home";
        break;
      case 1:
        _activeScreen = const LogsTabScreen();
        _activeScreenName = "Health Logs";
        break;
      case 2:
        _activeScreen = const VisualizationScreen();
        _activeScreenName = "Analytics";
        break;
      case 3:
        _activeScreen = const ReminderScreen();
        _activeScreenName = "Reminders";
        break;
      default:
        _activeScreen = const HomeScreen();
        _activeScreenName = "Home";
    }

    return Scaffold(
      appBar: AppBar(
          surfaceTintColor: const Color.fromRGBO(255, 255, 255, 1),
          // backgroundColor: const Color.fromARGB(255, 249, 239, 252),
          backgroundColor: Colors.white,
          titleSpacing: 20,
          title: Row(
            children: [
              ClipOval(
                  child: Image.asset("assets/icons/chart-logo.png",
                      width: 30, fit: BoxFit.cover)),
              const SizedBox(width: 10),
              CustomHeading(text: _activeScreenName, textSize: 20),
            ],
          ),
          actions: const [
            Icon(
              Icons.notifications_active_outlined,
              size: 30,
            ),
            SizedBox(width: 30),
          ]),
      body: _activeScreen, // Use _activeScreen instead of activePage
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.line_axis),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            label: '',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        unselectedItemColor: const Color.fromRGBO(140, 140, 140, 1),
        selectedItemColor: const Color.fromARGB(255, 113, 2, 144),
        showUnselectedLabels: true,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        iconSize: 22,
      ),
    );
  }
}
