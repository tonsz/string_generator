import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:string_generator/common/widgets/error_widget.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 100),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 24),
              child: sample.when(
                data: (sampleData) {
                  if (sampleData.randomString.isEmpty) {
                    return const MessageWidget(
                      icon: Icons.info_outline_rounded,
                      message: 'The fetched string is null or empty',
                    );
                  } else {
                    return Text(
                      sampleData.randomString,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 32,
                      ),
                    );
                  }
                },
                error: (e, s) {
                  return MessageWidget(
                    icon: Icons.error_outline_rounded,
                    message: e.toString(),
                  );
                },
                loading: () {
                  return const CircularProgressIndicator();
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  ref.invalidate(sampleProvider);
                },
                child: const Text('Generate a new string'))
          ],
        ),
      ),
    );
  }
}
