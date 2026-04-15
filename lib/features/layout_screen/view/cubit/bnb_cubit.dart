import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qerp_app/features/layout_screen/view/cubit/bnb_state.dart';

class BnbCubit extends Cubit<BnbState>{
  BnbCubit() : super(BnbState(bnbIndex: 0));

  void changeIndex({required int currentIndex}){
    emit(BnbState(bnbIndex: currentIndex));
  }
}