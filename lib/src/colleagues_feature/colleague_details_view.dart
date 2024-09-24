import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intelligence_demo_hr_tech/src/colleagues_feature/colleague.dart';

@RoutePage()
class ColleagueDetailsView extends StatelessWidget {
  const ColleagueDetailsView({
    super.key,
    @PathParam() required this.id,
    @QueryParam() this.points = 10,
  });

  final String id;
  final int points;
  Colleague get colleague => colleagues.firstWhere((c) => c.id == id);

  @override
  Widget build(BuildContext context) {
    final Colleague(:name) = colleague;
    return Scaffold(
      appBar: AppBar(
        title: Text('Reward $name efforts'),
      ),
      body: const Column(
        children: [
          Text('Why are they awesome?'),
          TextField(),
        ],
      ),
    );
  }
}
