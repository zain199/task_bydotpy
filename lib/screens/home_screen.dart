import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/screens/components/card_item.dart';

import '../providers/task_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController scrollController =ScrollController();
  @override
  void initState() {
    TaskPorvider taskPorvider = Provider.of(context,listen: false);
    scrollController.addListener(
          () {
        if ( taskPorvider.hasMorePages() && scrollController.position.pixels >= scrollController.position.maxScrollExtent && !(taskPorvider.loading)) {
          taskPorvider.loading= true;
          taskPorvider.getNewPage();
        }
      },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<TaskPorvider>(
        builder: (context, taskPorvider, child) {
          return taskPorvider.displayedData.isNotEmpty
              ? ListView(
                  controller: scrollController,
                  children: List.generate(
                      taskPorvider.displayedData.length,
                      (index) =>
                          CardItem(item: taskPorvider.displayedData[index]),
                  ),
                )
              : const Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}
