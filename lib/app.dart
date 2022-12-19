import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slot_machine_game/routes.dart';
import 'package:slot_machine_game/slot_machine_cubit/slot_machine_cubit.dart';

class SlotMachineApp extends StatelessWidget {
  const SlotMachineApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SlotMachineCubit>(
      create: (context) => SlotMachineCubit(),
      child: MaterialApp(
        routes: applicationRoutes,
        initialRoute: splashScreenRoute,
      ),
    );
  }
}
