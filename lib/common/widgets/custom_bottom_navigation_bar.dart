class CustomBottomNavigationBar extends StatelessWidget {

  final int currentIndex;
  final Function(int) onTap;

  CustomBottomNavigationBar({required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: currentIndex == 0
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
            onPressed: () => onTap(0),
          ),
          IconButton(
            icon: Icon(
              Icons.flash_on,
              color: currentIndex == 1
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
            onPressed: () => onTap(1),
          ),
          SizedBox(width: 48), 
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: currentIndex == 3
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
            onPressed: () => onTap(3),
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              color: currentIndex == 4
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).iconTheme.color,
            ),
            onPressed: () => onTap(4),
          ),
        ],
      ),
    );
  }
}