import 'package:flutter/material.dart';
import 'package:task/models/coin_model.dart';
import 'package:task/screens/widgets/info_widget.dart';

class CardItem extends StatelessWidget {
  final TaskModel item;
  const CardItem({Key? key,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          InfoWidget(title:'id:' ,data: item.id??'id'),
          InfoWidget(title:'symbol:' ,data: item.symbol??'symbol'),
          InfoWidget(title:'name:' ,data: item.name??'name'),


        ],
      ),
    );
  }
}
