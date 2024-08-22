import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  
  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,
              color: currentIndex == 0
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).iconTheme.color),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart,
              color: currentIndex == 1
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).iconTheme.color),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_pin,
              color: currentIndex == 2
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).iconTheme.color),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite,
              color: currentIndex == 3
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).iconTheme.color),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person,
              color: currentIndex == 4
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).iconTheme.color),
          label: '',
        ),
      ],
    );
  }
}
