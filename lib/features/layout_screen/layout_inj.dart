import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:qerp_app/core/injection/injection_container.dart';
import 'package:qerp_app/features/layout_screen/view/cubit/bnb_cubit.dart';

Future<void> initLayoutInjection(GetIt sl) async{
  sl.registerFactory<BnbCubit>(() => BnbCubit());
}
List<BlocProvider> appLayoutBlocs(BuildContext context) => [
BlocProvider<BnbCubit>(create: (BuildContext context) => sl<BnbCubit>(),)
];