import '../../../../../../prestars_exports.dart';

class GetTabsItems {
  static List<TabEntity> call() => [
        TabEntity(route: ConstantsRoutes.root, label: ConstantsLabels.home),
        TabEntity(
            route: ConstantsRoutes.athletes, label: ConstantsLabels.athletes),
        TabEntity(route: ConstantsRoutes.teams, label: ConstantsLabels.teams)
      ];
}
