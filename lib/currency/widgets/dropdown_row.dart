import 'package:flutter/material.dart';

class DropdownRow extends StatelessWidget {
  final String label;
  final String value;
  final Map currencies;
  final void Function(String?) onChanged;

  const DropdownRow({
    super.key,
    required this.label,
    required this.value,
    required this.currencies,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(6)),

      //color: Colors.teal,
      child:  DropdownButton<String>(
        borderRadius: BorderRadius.circular(20),
        underline: SizedBox(),
        menuMaxHeight: 500.0,
        value: value,
        icon: const Icon(Icons.arrow_drop_down_rounded),
        isExpanded: true,
        onChanged: onChanged,
        items: currencies.keys
            .toSet()
            .toList()
            .map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(

            alignment: Alignment.center,
            value: value,
            child: Text(
              '$value - ${currencies[value]}',
              overflow: TextOverflow.ellipsis,

              style: TextStyle(color: Colors.black,fontSize: 11,fontWeight: FontWeight.bold),
            ),
          );
        }).toList(),
      ),
    );
  }
}
