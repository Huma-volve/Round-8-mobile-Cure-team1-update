import 'package:flutter/material.dart';

import 'map_theme.dart';

class MapAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MapAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Your Location"),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.white,
      foregroundColor: mapTitleColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
