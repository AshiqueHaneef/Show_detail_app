import 'package:flutter/material.dart';
import 'package:show_detail_app/models/show_detail.dart';
import 'package:show_detail_app/screens/cast_screen.dart';

class NewActivity extends StatefulWidget {
  final ShowDetail showDetail;
  const NewActivity({Key? key, required this.showDetail}) : super(key: key);

  @override
  State<NewActivity> createState() => _NewActivityState();
}

class _NewActivityState extends State<NewActivity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Show Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(widget.showDetail.image?.original ?? ""),
              SizedBox(
                height: 10,
              ),
              Text(widget.showDetail.summary ?? "")
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Text("Display Cast"),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CastScreen(
                            showDetail: widget.showDetail,
                          )));
            }),
      ),
    );
  }
}
