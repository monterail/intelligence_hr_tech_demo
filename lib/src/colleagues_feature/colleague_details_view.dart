import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intelligence_demo_hr_tech/src/app_router.gr.dart';
import 'package:intelligence_demo_hr_tech/src/colleagues_feature/colleague.dart';

@RoutePage()
class ColleagueDetailsView extends StatelessWidget {
  const ColleagueDetailsView({
    super.key,
    @PathParam() required this.id,
    @QueryParam() this.points = 0,
  });

  final String id;
  final int points;
  Colleague get colleague => colleagues.firstWhere((c) => c.id == id);

  int get pointsLeft => 100 - points;

  @override
  Widget build(BuildContext context) {
    final Colleague(:name, :profilePic) = colleague;
    final firstName = name.split(' ').first;

    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
          TextSpan(
            children: [
              const TextSpan(text: 'Reward'),
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      profilePic,
                      width: 32,
                      height: 32,
                    ),
                  ),
                ),
              ),
              TextSpan(text: '$firstName\'s efforts'),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Labeled(
                    label: 'Points',
                    child: TextField(
                      controller: TextEditingController(
                        text: points == 0 ? '' : points.toString(),
                      ),
                      decoration: InputDecoration(
                        hintText: '10',
                        hintStyle: TextStyle(
                          color: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.color
                              ?.withOpacity(.4),
                        ),
                        helperText: '$pointsLeft after the reward',
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        fillColor:
                            Theme.of(context).primaryColorLight.withOpacity(.4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Labeled(
                    label: 'Tag',
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        fillColor:
                            Theme.of(context).primaryColorLight.withOpacity(.4),
                      ),
                      controller: TextEditingController(text: '#teamwork'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Labeled(
              label: 'Why are they awesome?',
              child: TextField(
                minLines: 4,
                maxLines: 6,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Pick the right words to describe your gratitude',
                  hintStyle: TextStyle(
                    color: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.color
                        ?.withOpacity(.4),
                  ),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  fillColor:
                      Theme.of(context).primaryColorLight.withOpacity(.4),
                ),
              ),
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: () async {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('✨ Reward granted'),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                );
                await Future.delayed(const Duration(seconds: 1));
                context.router.replaceAll([const ColleaguesListRoute()]);
              },
              label: const Text('Send reward'),
            ),
          ],
        ),
      ),
    );
  }
}

class Labeled extends StatelessWidget {
  const Labeled({super.key, required this.label, required this.child});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label),
        const SizedBox(height: 6),
        child,
      ],
    );
  }
}
