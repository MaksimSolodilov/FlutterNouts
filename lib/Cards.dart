import 'package:flutter/material.dart';
import 'Settings.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});
  
  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isTapped = false;
  bool _hasChanged = false;

  void _toggleImage() {
    setState(() {
      if (!_hasChanged) {
        _isTapped = !_isTapped;
        _hasChanged = true;
      }
    });
  }
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center( 
        child: Dismissible(
          key: Key('dismiss_key'), // Уникальный ключ для Dismissible
          direction: DismissDirection.startToEnd, // Направление свайпа
          onDismissed: (direction) {
            // Действие при свайпе
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const Menu()),
            );
          },
          // background: Container(
          //   color: const Color.fromARGB(255, 255, 255, 255), // Цвет фона при свайпе
          //   alignment: Alignment.centerLeft,
          //   child: const Padding(
          //     padding: EdgeInsets.all(16.0),
          //     child: Icon(Icons.arrow_back, color: Colors.white),
          //   ),
          // ),
          child: GestureDetector(
            onTap: _toggleImage,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(5, 5),
                  ),
                ],
              ), 
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeTransition(
                  opacity: _animation,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      _isTapped ? 'image/img2.png' : 'image/Icons.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}