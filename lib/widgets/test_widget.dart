import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0);

class TestWidget extends ConsumerWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    StateController<int> counter = ref.read(counterProvider.notifier);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Consumer(builder: (context, watch, _) {
          final count = ref.watch(counterProvider);
          return Text('Count: $count');
        }),
        FloatingActionButton(
          onPressed: () => counter.state++,
          child: Icon(Icons.add),
        ),
      ],
    );
  }


}
