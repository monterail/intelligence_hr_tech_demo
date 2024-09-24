import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intelligence/intelligence.dart';
import 'package:intelligence/model/representable.dart';
import 'package:intelligence_demo_hr_tech/src/app_router.gr.dart';
import 'package:intelligence_demo_hr_tech/src/colleagues_feature/colleague.dart';

@RoutePage()
class ColleaguesListView extends StatefulWidget {
  const ColleaguesListView({super.key});

  @override
  State<ColleaguesListView> createState() => _ColleaguesListViewState();
}

class _ColleaguesListViewState extends State<ColleaguesListView> {
  @override
  void initState() {
    super.initState();
    Intelligence().populate(
      colleagues
          .map((colleague) =>
              Representable(representation: colleague.name, id: colleague.id))
          .toList(),
    );
  }

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
          final Colleague(:id, :name, :profilePic) = colleagues[index];

          return ListTile(
            title: Text(name),
            // subtitle: Align(
            //   alignment: Alignment.centerLeft,
            //   child: Tag(child: Text(id)),
            // ),
            leading: CircleAvatar(foregroundImage: NetworkImage(profilePic)),
            onTap: () {
              context.router.push(ColleagueDetailsRoute(id: id));
            },
          );
        },
      ),
    );
  }
}
