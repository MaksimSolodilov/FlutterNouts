import 'package:flutter/material.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:iconly/iconly.dart';

import 'historynote.dart';
import 'addANote.dart';
import 'shop.dart';
import 'Quests.dart';
import 'home.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

enum _SelectedTab { History, Home, AddN, Quest, Shop }

class _MenuState extends State<Menu> {
  // Текущая выбранная вкладка
  _SelectedTab _selectedTab = _SelectedTab.Home;

  // Метод для обработки изменения выбранной вкладки
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  // Метод для получения виджета страницы по выбранной вкладке
  Widget _getPage() {
    switch (_selectedTab) {
      case _SelectedTab.History:
        return const History();
      case _SelectedTab.Home:
        return const Home();
      case _SelectedTab.AddN:
        return const AddN();
      case _SelectedTab.Quest:
        return const Quest();
      case _SelectedTab.Shop:
        return const Shop();
      // default:7
      //   return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _getPage(), // отображение выбранной страницы
      bottomNavigationBar: CrystalNavigationBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        outlineBorderColor: Colors.white,
        onTap: _handleIndexChanged,
        items: [
          CrystalNavigationBarItem(
            icon: IconlyBold.document,
            unselectedIcon: IconlyLight.document,
            selectedColor: Colors.black,
          ),
          CrystalNavigationBarItem(
            icon: IconlyBold.home,
            unselectedIcon: IconlyLight.home,
            selectedColor: Colors.black,
          ),
          CrystalNavigationBarItem(
            icon: IconlyBold.plus,
            unselectedIcon: IconlyLight.plus,
            selectedColor: Colors.black,
          ),
          CrystalNavigationBarItem(
            icon: IconlyBold.game,
            unselectedIcon: IconlyLight.game,
            selectedColor: Colors.black,
          ),
          CrystalNavigationBarItem(
            icon: IconlyBold.wallet,
            unselectedIcon: IconlyLight.wallet,
            selectedColor: Colors.black,
          ),
        ],
      ),
    );
  }
}