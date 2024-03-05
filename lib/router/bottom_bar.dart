import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_template/provider/router_provider/bottom_bar_provider.dart';
import 'package:my_template/router/drawer_nav.dart';
import 'package:my_template/views/home/home.dart';

class BottomBar extends ConsumerStatefulWidget {
  const BottomBar({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomBarState();
}

class _BottomBarState extends ConsumerState<BottomBar> {
  @override
  Widget build(BuildContext context) {
    var index = ref.watch(bottomBarProvider);
    return Scaffold(
      drawer: const DrawerWid(),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (value) => {
          ref.read(bottomBarProvider.notifier).state = value,
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: '',
          ),
          NavigationDestination(icon: Icon(Icons.south_america), label: ''),
          NavigationDestination(icon: Icon(Icons.ac_unit), label: ''),
        ],
      ),
      body: [
        const HomeScreen(),
        const Bottom1(),
        const Bottom2(),
      ][index],
    );
  }
}
