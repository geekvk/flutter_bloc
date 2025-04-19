/*
responsible for providing  counter viewe

-- use Block provider
*/
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/counter/counter_cubit.dart';
import 'package:flutter_bloc_app/counter/counter_view.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create : (context) => CounterCubit(0),
    // counter view (UI)
    // child: const CounterView(),
    child: BlocListener<CounterCubit, int>(
        listener: (context, state){
            // show popup when reached to 10
            if(state == 10){
                showDialog(
                    context: context, 
                    builder: (context) => const AlertDialog(
                        content : Text("10 reached")
                    )
                );
            }
        },
        child: const CounterView(),
        ),
    
    );
  }
}