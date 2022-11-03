import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  final String title;
  final String data;

  const InfoWidget({Key? key, required this.data, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title)),
        Expanded(
            flex: 2,
            child: Text(
              data,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )),
      ],
    );
  }
}
