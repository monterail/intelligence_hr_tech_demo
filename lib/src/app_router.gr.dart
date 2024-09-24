// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:intelligence_demo_hr_tech/src/colleagues_feature/colleague_details_view.dart'
    as _i1;
import 'package:intelligence_demo_hr_tech/src/colleagues_feature/colleagues_list_view.dart'
    as _i2;

/// generated route for
/// [_i1.ColleagueDetailsView]
class ColleagueDetailsRoute
    extends _i3.PageRouteInfo<ColleagueDetailsRouteArgs> {
  ColleagueDetailsRoute({
    _i4.Key? key,
    required String id,
    int points = 0,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          ColleagueDetailsRoute.name,
          args: ColleagueDetailsRouteArgs(
            key: key,
            id: id,
            points: points,
          ),
          rawPathParams: {'id': id},
          rawQueryParams: {'points': points},
          initialChildren: children,
        );

  static const String name = 'ColleagueDetailsRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final queryParams = data.queryParams;
      final args = data.argsAs<ColleagueDetailsRouteArgs>(
          orElse: () => ColleagueDetailsRouteArgs(
                id: pathParams.getString('id'),
                points: queryParams.getInt(
                  'points',
                  0,
                ),
              ));
      return _i1.ColleagueDetailsView(
        key: args.key,
        id: args.id,
        points: args.points,
      );
    },
  );
}

class ColleagueDetailsRouteArgs {
  const ColleagueDetailsRouteArgs({
    this.key,
    required this.id,
    this.points = 0,
  });

  final _i4.Key? key;

  final String id;

  final int points;

  @override
  String toString() {
    return 'ColleagueDetailsRouteArgs{key: $key, id: $id, points: $points}';
  }
}

/// generated route for
/// [_i2.ColleaguesListView]
class ColleaguesListRoute extends _i3.PageRouteInfo<void> {
  const ColleaguesListRoute({List<_i3.PageRouteInfo>? children})
      : super(
          ColleaguesListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ColleaguesListRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.ColleaguesListView();
    },
  );
}
