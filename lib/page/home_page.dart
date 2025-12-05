import 'package:flutter/material.dart';
import '../fragment/generate_text.dart';
import '../fragment/generate_image.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          'AI Cooking Helper (Kelompok 10)',
          style: TextStyle(color: Colors.white),
        ),
        bottom: TabBar(
          controller: tabController,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black54,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: 'Resep dari Teks', icon: Icon(Icons.text_fields)),
            Tab(text: 'Resep dari Gambar', icon: Icon(Icons.image)),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [FragmentGenerateText(), FragmentGenerateImage()],
      ),
    );
  }
}
