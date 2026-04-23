import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeProvider>();

    return ListView(
      children: [
        SwitchListTile(
          title: const Text("Dark Mode"),
          value: theme.isDark,
          onChanged: (_) {
            context.read<ThemeProvider>().toggleTheme();
          },
        ),
        const ListTile(title: Text("Họ tên: Trịnh Lê Đình Hồ")),
        const ListTile(title: Text("MSSV: 2224802010424")),
        const ListTile(title: Text("Lớp: CNTT")),
      ],
    );
  }
}
