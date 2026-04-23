import 'package:flutter/material.dart';
import 'category_screen.dart';
import 'latest_screen.dart';
import 'settings_screen.dart';
import 'home_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  final List<Widget> screens = const [
    HomeTab(), // Tin tổng hợp
    CategoryScreen(), // Chủ đề
    LatestScreen(), // Tin mới nhất
    SettingsScreen(), // Cài đặt
  ];

  void refreshData() {
    setState(() {}); // reload FutureBuilder trong các tab
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ĐỌC BÁO ONLINE"),
        centerTitle: true,

        // 🔥 NÚT REFRESH BÊN PHẢI
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              refreshData();

              // (optional) thông báo nhỏ
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Đang làm mới...")));
            },
          ),
        ],
      ),

      // 🔥 BODY THEO TAB
      body: screens[index],

      // 🔥 BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,

        onTap: (i) {
          setState(() {
            index = i;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: "Tin tổng hợp",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "Chủ đề"),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: "Tin mới nhất",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Cài đặt"),
        ],
      ),
    );
  }
}
