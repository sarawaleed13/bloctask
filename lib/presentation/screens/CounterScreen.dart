import 'package:bloctask/data/bloc/ThemeBloc/theme_bloc.dart';
import 'package:bloctask/data/bloc/counterBloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("counter"),
      centerTitle: true,
      ),
      body: Center(
        child: BlocConsumer<CounterBloc, int>(
          listener: (context, state) {
            if (state == 5) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Counter reached 5!")),
              );
            }
          },
          builder: (context, state) {
            return Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  "Counter: $state",
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(IncrementEvent()),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => context.read<ThemeBloc>().add(ThemeEvent.toggle),
            child: const Icon(Icons.brightness_6),
          ),
        ],
      ),
    );
  }
}