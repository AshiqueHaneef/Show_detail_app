import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:show_detail_app/bloc/cast_cubit/cubit/cast_data_cubit.dart';
import 'package:show_detail_app/models/show_detail.dart';

class CastScreen extends StatefulWidget {
  final ShowDetail showDetail;
  const CastScreen({Key? key, required this.showDetail}) : super(key: key);

  @override
  State<CastScreen> createState() => _CastScreenState();
}

class _CastScreenState extends State<CastScreen> {
  @override
  void initState() {
    context.read<CastDataCubit>().getCast(widget.showDetail.id.toString());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final castCubitState = context.watch<CastDataCubit>().state;
    final castcubit = context.watch<CastDataCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Cast"),
      ),
      body: castCubitState is CastDataLoading
          ? const Center(child: CircularProgressIndicator())
          : castCubitState is CastDataLoaded
              ? Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: castCubitState.castList.map((e) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text(e.person?.name ?? ""),
                            leading: Image.network(
                              e.person?.image?.medium ?? "",
                              height: 50,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              : const Center(child: Text("no data found")),
    );
  }
}
