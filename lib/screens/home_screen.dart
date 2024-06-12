import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:string_generator/common/widgets/message_widget.dart';
import 'package:string_generator/providers/sample_provider.dart';

/// The home screen of Random String Generator application.
///
/// It has an app bar, a text for the generated string
/// and a button that generates a new string if pressed.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    /// This declaration allows the HomeScreen
    /// to listen to the state of [sampleProvider].
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
                /// The when method dynamically renders different widgets
                /// based on the state of [sample].
                data: (sampleData) {
                  if (sampleData.randomString.isEmpty) {
                    /// A condition if the data is fetched successfully
                    /// but the string is empty.
                    ///
                    /// An empty string is also the default value if it is null.
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
                  /// Displays a [MessageWidget] if an error occurs.
                  return MessageWidget(
                    icon: Icons.error_outline_rounded,
                    message: e.toString(),
                  );
                },
                loading: () {
                  /// Displays a loader for the loading state.
                  return const CircularProgressIndicator();
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  /// Invokes a refresh of the [sampleProvider]
                  /// resulting to a newly generated string
                  ref.invalidate(sampleProvider);
                },
                child: const Text('Generate a new string'))
          ],
        ),
      ),
    );
  }
}
