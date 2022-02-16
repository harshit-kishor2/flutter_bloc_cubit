import 'dart:async';

import 'package:cubit_demo/view_model/view_model.dart';
import 'package:cubit_demo/views/Screens/tab_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int data = 0;
  String error = '';
  TextEditingController typeController = TextEditingController();

  FutureOr onIncrement(BuildContext context) {
    if (typeController.text == 'Bloc') {
      context.read<CounterBlocBloc>().add(IncrementEvent(value: data));
    } else if (typeController.text == 'Cubit') {
      context.read<CounterCubit>().incrementValue(data);
    } else {
      setState(() {
        error = "Please choose type";
      });
    }
  }

  FutureOr onDecrement(BuildContext context) {
    if (typeController.text == 'Bloc') {
      context.read<CounterBlocBloc>().add(DecrementEvent(value: data));
    } else if (typeController.text == 'Cubit') {
      context.read<CounterCubit>().decrementValue(data);
    } else {
      setState(() {
        error = "Please choose type";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Counter App")),
      ),
      body: SafeArea(
        child: MultiBlocListener(
          listeners: [
            BlocListener<CounterCubit, CounterState>(
              listener: (context, state) {
                _handleCubitListener(context, state);
              },
            ),
            BlocListener<CounterBlocBloc, CounterBlocState>(
              listener: (context, state) {
                _handleBlocListener(context, state);
              },
            )
          ],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                child: DropdownButtonFormField(
                  onTap: () => FocusScope.of(context).unfocus(),
                  value: typeController.text,
                  onChanged: (String? value) {
                    setState(() {
                      error = '';
                      data = 0;
                      typeController.text = value ?? '';
                    });
                  },
                  items: const [
                    DropdownMenuItem<String>(
                        child: Text('Select Type'), value: ''),
                    DropdownMenuItem<String>(
                        child: Text('Cubit'), value: 'Cubit'),
                    DropdownMenuItem<String>(
                        child: Text('Bloc'), value: 'Bloc'),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text("${typeController.text} Value $data"),
              Text(
                error,
                style: const TextStyle(color: Colors.red),
              ),
              const SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      onIncrement(context);
                    },
                    child: const Text("Increment"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      onDecrement(context);
                    },
                    child: const Text("Decrement"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const TabView()));
                    },
                    child: const Text("Open Tab View"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _handleCubitListener(BuildContext context, state) {
    if (state is CounterLoaded) {
      setState(() {
        data = state.value;
        error = '';
      });
    } else if (state is CounterError) {
      setState(() {
        error = state.error;
      });
    }
  }

  void _handleBlocListener(BuildContext context, state) {
    if (state is CounterBlocLoaded) {
      setState(() {
        data = state.value;
        error = '';
      });
    } else if (state is CounterBlocError) {
      setState(() {
        error = state.error;
      });
    }
  }
}
