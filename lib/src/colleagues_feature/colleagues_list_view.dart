import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intelligence_demo_hr_tech/src/colleagues_feature/colleague.dart';

@RoutePage()
class ColleaguesListView extends StatelessWidget {
  const ColleaguesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Colleagues'),
      ),
      body: ListView.builder(
        restorationId: 'sampleItemListView',
        itemCount: colleagues.length,
        itemBuilder: (BuildContext context, int index) {
          final Colleague(:id, :name) = colleagues[index];

          return ListTile(
              title: Text(name),
              subtitle: Chip(label: Text(id)),
              leading: const CircleAvatar(
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {});
        },
      ),
    );
  }
}
