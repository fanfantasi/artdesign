import 'package:artdesign/app/presentation/article/article_binding.dart';
import 'package:artdesign/app/presentation/article/article_view.dart';
import 'package:artdesign/app/presentation/article/detailarticle/detailarticle_binding.dart';
import 'package:artdesign/app/presentation/article/detailarticle/detailarticle_view.dart';
import 'package:artdesign/app/presentation/event/event_binding.dart';
import 'package:artdesign/app/presentation/event/event_view.dart';
import 'package:artdesign/app/presentation/product/product_binding.dart';
import 'package:artdesign/app/presentation/product/product_view.dart';
import 'package:artdesign/app/presentation/professional/professional_binding.dart';
import 'package:artdesign/app/presentation/professional/professional_view.dart';
import 'package:artdesign/app/presentation/projectdetail/project_detail_binding.dart';
import 'package:artdesign/app/presentation/projectdetail/project_detail_view.dart';
import 'package:artdesign/app/presentation/projects/projects_binding.dart';
import 'package:artdesign/app/presentation/projects/projects_view.dart';
import 'package:get/get.dart';

import '../../presentation/dashboard/dashboard_binding.dart';
import '../../presentation/dashboard/dashboard_view.dart';
part 'app_routes.dart';

class AppPages {
  static const inital = Routes.dashboard;

  static final routes = [
    GetPage(
        name: Routes.dashboard,
        page: () => const DashboardScreen(),
        binding: DashboardBinding()),
    GetPage(
        name: Routes.products,
        page: () => const ProductView(),
        transition: Transition.cupertino,
        binding: ProductBinding()),
    GetPage(
        name: Routes.events,
        page: () => const EventView(page: false),
        transition: Transition.cupertino,
        binding: EventBinding()),
    GetPage(
        name: Routes.article,
        page: () => const ArticleView(),
        transition: Transition.cupertino,
        binding: ArticleBinding()),
    GetPage(
        name: Routes.articlebyid,
        page: () => const DetailArticleWidget(),
        transition: Transition.cupertino,
        binding: DetailArticleBinding()),
    GetPage(
        name: Routes.projects,
        page: () => const ProjectsScreen(),
        transition: Transition.cupertino,
        binding: ProjectsBinding()),
    GetPage(
        name: Routes.projectdetail,
        page: () => const ProjectDetailViewScreen(),
        transition: Transition.cupertino,
        binding: ProjectDetailBinding()),
    GetPage(
        name: Routes.professional,
        page: () => const ProfessionalScreen(),
        transition: Transition.cupertino,
        binding: ProfessionalBinding()),
  ];
}
