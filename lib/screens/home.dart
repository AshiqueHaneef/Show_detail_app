import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:show_detail_app/bloc/cubit/show_detail_cubit.dart';
import 'package:show_detail_app/data/repository.dart';
import 'package:show_detail_app/models/show_detail.dart';
import 'package:show_detail_app/screens/new_activity.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final showCubitState = context.watch<ShowDetailCubit>().state;
    final showCubit = context.watch<ShowDetailCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: showCubitState is ShowDetailsLoading
          ? const Center(child: CircularProgressIndicator())
          : showCubitState is ShowDetailsLoaded
              ? GridView.builder(
                  itemCount: (showCubitState).showList.length,
                  padding: const EdgeInsets.all(12),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    List<ShowDetail> showList = (showCubitState).showList;
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewActivity(
                                      showDetail: showList[index],
                                    )));
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Image.network(
                                showList[index].image?.medium.toString() ?? "",
                                height: 100,
                                width: 100,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                showList[index].name ?? "",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Colors.red),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })
              : const Center(child: Text("No data found")),
    );
  }
}
