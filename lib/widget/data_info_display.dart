import 'package:flutter/material.dart';

import '../model/data.dart';

class DataInfoDisplay extends StatelessWidget {
  final DataInfo data;
  const DataInfoDisplay(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            // alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            width: double.infinity,
            child: Text(
              data.message,
              textAlign: TextAlign.left,
              softWrap: true,
              style: const TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
