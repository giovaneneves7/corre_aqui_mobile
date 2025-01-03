import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with SingleTickerProviderStateMixin {
  
  late AnimationController _animationController;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0.8,
      upperBound: 1.2,
    )..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        if (_isListening) {
          _animationController.forward();
        }
      }
    });
  }

  void _startListening() {
    if (!_isListening) {
      setState(() {
        _isListening = true;
        _animationController.forward();
      });
    }
  }

  void _stopListening() {
    if (_isListening) {
      setState(() {
        _isListening = false;
      });
      _animationController.stop();
      _animationController.reset();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: "Buscar produtos, lojas e mais...",
            prefixIcon: const Icon(Icons.search, color: Colors.grey),
            suffixIcon: GestureDetector(
              onTapDown: (_) => _startListening(),
              onTapUp: (_) => _stopListening(),
              child: ScaleTransition(
                scale: _animationController,
                child: Icon(
                  Icons.mic,
                  color: _isListening ? Colors.red : Colors.grey,
                ),
              ),
            ),
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Os mais buscados",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  _buildSearchItem("Iphone", "Celular e Smartphone"),
                  _buildSearchItem("Geladeira", "Geladeira"),
                  _buildSearchItem("Iphone 15", "Celular e Smartphone"),
                  _buildSearchItem("Ar condicionado", "Ar-Condicionado"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchItem(String title, String category) {
    return ListTile(
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(category, style: const TextStyle(color: Colors.grey)),
      trailing: const Icon(Icons.arrow_outward, size: 16),
      onTap: () {
        debugPrint('Item selecionado: $title');
      },
    );
  }
}