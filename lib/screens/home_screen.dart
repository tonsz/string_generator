import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:string_generator/providers/sample_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final sample = ref.watch(sampleProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Random String Generator'),
      ),
      body: Center(
        child: sample.when(
          data: (sampleData) {
            return Text(sampleData.randomString ?? '');
          },
          error: (e, s) {
            return Text(e.toString());
          },
          loading: () {
            return CircularProgressIndicator();
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
