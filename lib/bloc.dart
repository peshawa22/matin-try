import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matin/state.dart';

class CounterBloc extends Cubit<CounterState>{
  int count=0;
  CounterBloc():super(Initial());
  void increase(){
    if(count<5){
      emit(Increment(count++));
    }else{
      emit(Error('some thing is wrong'));
    }
  }

}