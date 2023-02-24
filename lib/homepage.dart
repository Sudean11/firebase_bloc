import 'package:dio/dio.dart';
import 'package:firebase_bloc/apidata.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key}) {
    getValues();
  }
  List<ApiData>? apiList;

  void getValues() async {
    final dio = Dio();
    final response = await dio.get('https://api.axiossoftwork.com/updatetable');
    final List parsedList = response.data;
    apiList = parsedList.map((e) => ApiData.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: const Text("hello"),
          centerTitle: true,
          leading: BackButton(onPressed: () {
            backClicked(context);
          }),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.grey.shade100.withOpacity(0.3),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("hello"),
                Text("helsadfa"),
                Text("hewer"),
                Expanded(
                  child: ListView.builder(
                    itemCount: apiList?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(apiList?[index].firstName ?? ""),
                      );
                    },
                  ),
                )
              ]),
        )));
  }

  something(BuildContext context) {
    const snackbar = SnackBar(content: Text("hello"));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => HomePage(),
    ));
  }

  backClicked(BuildContext context) {
    const snackbar = SnackBar(content: Text("hello"));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => HomePage(),
    ));
  }
}

Widget NewTextView() {
  return (Text("sudin"));
}
