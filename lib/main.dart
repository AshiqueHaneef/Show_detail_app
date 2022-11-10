import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:show_detail_app/bloc/cast_cubit/cubit/cast_data_cubit.dart';
import 'package:show_detail_app/bloc/cubit/show_detail_cubit.dart';
import 'package:show_detail_app/screens/home.dart';

void main() => runApp(MultiBlocProvider(providers: [
      BlocProvider(create: (context) => ShowDetailCubit()..getShows()),
      BlocProvider(create: (context) => CastDataCubit()),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Show Detail App', home: Home());
  }
}
