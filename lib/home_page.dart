import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matin/bloc.dart';
import 'package:matin/state.dart';

class MyApp extends StatefulWidget {
   const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: BlocProvider(
          create: (BuildContext context) =>CounterBloc(),
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<CounterBloc,CounterState>(
                buildWhen: (previous,current){
                  if(current is Error){
                    return false;
                  }return true;
                },
                builder: (context,state){
                  if(state is Initial){
                    return const Text('initial');
                  }if(state is Increment){
                    return Text(state.count.toString());
                  }if(state is Decrement){
                    return Text(state.count.toString());
                  }
                  if(state is Remove){
                    return Text(state.count.toString());
                  }
                  if(state is Error){
                    return Text(state.error);
                  }
                  else{return const Text('Nothings');}
                },
                listener: (BuildContext context, CounterState state) {
                  if(state is Error){
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
                  }
                },
              ),
              const SizedBox(height: 20,),
              Builder(builder: (context){
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(onPressed: (){
                      context.read<CounterBloc>().increase();
                    }, child: const Text('increase')),
                    TextButton(onPressed: (){
                      context.read<CounterBloc>().remove();
                    }, child: const Text('remove')),
                    TextButton(onPressed: (){
                      context.read<CounterBloc>().decrease();
                    }, child: const Text('decrease'))
                  ],
                );
              }),
              
            ],
          ),
        )
        )
      ),
    );
  }
}
