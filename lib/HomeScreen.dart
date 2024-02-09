// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:news_app/Models/newsModel.dart';
import 'package:news_app/Service/repository/newsProvider.dart';
import 'package:provider/provider.dart';

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
    final watch = context.watch<NewsProvier>();
    final read = context.read<NewsProvier>();
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
                onChanged: (value) {
                  read.getArticles(value, null);
                },
                controller: tf1,
                decoration: const InputDecoration(hintText: 'search for ...'),
              ),
              const SizedBox(
                height: 8,
              ),
              TextField(
                onChanged: (value) {
                  read.getArticles(null, value);
                },
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
              Consumer(
                builder: (BuildContext context, NewsProvier value, Widget? _) {
                  if (value.isloading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final articals = value.searchArticles1;
                  return CardListView(
                    articals: articals,
                  );
                },
              ),
              const SizedBox(
                height: 18,
              ),
              const Text('Result 2:'),
              const SizedBox(
                height: 10,
              ),
              Consumer(
                builder: (BuildContext context, NewsProvier value, Widget? _) {
                  if (value.isloading2) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final articals = value.searchArticles2;
                  return CardListView(
                    articals: articals,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardListView extends StatelessWidget {
  const CardListView({
    Key? key,
    required this.articals,
  }) : super(key: key);
  final List<Article> articals;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.grey[400]),
      height: MediaQuery.of(context).size.height * 0.35,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: articals.length, // Replace with your actual data count
        itemBuilder: (context, index) {
          final artical = articals[index];
          return ListTile(
            title: Text('Title: ${artical.title}'),
          );
        },
      ),
    );
  }
}
