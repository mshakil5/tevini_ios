import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CustomTitleKeyValue extends StatelessWidget {
  final titleKey;
  final titleValue;

  const CustomTitleKeyValue(
      {required this.titleKey, required this.titleValue, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _customTitleKeyValue(titleKey, titleValue);
  }

  _customTitleKeyValue(String key, String value) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              flex: 2,
              child: Text(
                key,

                maxLines: 1,
                style: TextStyle(color: Colors.black),
              )),
          Expanded(
              flex: 3,
              child: Text(' : $value', style: const TextStyle(


                  fontWeight: FontWeight.w700,
                  color: Colors.black
              )),),
        ],
      ),
    );
  }

}
