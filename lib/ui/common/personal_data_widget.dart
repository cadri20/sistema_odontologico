import 'package:flutter/material.dart';

class PersonalData extends StatelessWidget {
  final Map<String, String> _dataMap;
  const PersonalData(this._dataMap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _dataMap.entries.length % 2 == 0 ? _buildEvenData() : _buildOddData(),
      ),
    );
  }

  Widget _buildEvenData() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for(int i = 0; i < _dataMap.entries.length / 2; i++)
                _buildData(_dataMap.entries.elementAt(i))
            ],
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for(int i = _dataMap.entries.length ~/ 2; i < _dataMap.entries.length; i++)
              _buildData(_dataMap.entries.elementAt(i))
          ],
        ),
      ],
    );
  }

  Widget _buildOddData() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildData(_dataMap.entries.elementAt(0)),
        ],
      ),
    );
  }

  Widget _buildData(MapEntry<String, String> entry) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '${entry.key}: ',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          '${entry.value}',
          style: const TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
