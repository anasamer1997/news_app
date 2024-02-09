import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final tf1 = TextEditingController(), tf2 = TextEditingController();
  @override
  void dispose() {
    tf1.dispose();
    tf2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: tf1,
                decoration: const InputDecoration(hintText: 'search for ...'),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                controller: tf2,
                decoration: const InputDecoration(hintText: 'search for ...'),
              ),
              const SizedBox(
                height: 18,
              ),
              const Text('Result 1:'),
              const SizedBox(
                height: 8,
              ),
              CardListView(),
              const SizedBox(
                height: 18,
              ),
              const Text('Result 2:'),
              const SizedBox(
                height: 10,
              ),
              CardListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class CardListView extends StatelessWidget {
  const CardListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey[400]),
      height: MediaQuery.of(context).size.height * 0.35,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 20, // Replace with your actual data count
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item $index from ListView 2'),
          );
        },
      ),
    );
  }
}
