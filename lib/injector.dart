import 'package:artdesign/app/data/datasources/article_local_datasource.dart';
import 'package:artdesign/app/data/datasources/event_local_datasource.dart';
import 'package:artdesign/app/data/datasources/featured_professional_local_datasource.dart';
import 'package:artdesign/app/data/datasources/featured_projects_local_datasource.dart';
import 'package:artdesign/app/data/repositories/article_repository_impl.dart';
import 'package:artdesign/app/data/repositories/event_repository_impl.dart';
import 'package:artdesign/app/data/repositories/featured_professional_repository_impl.dart';
import 'package:artdesign/app/data/repositories/featured_project_repository_impl.dart';
import 'package:artdesign/app/data/repositories/sliders_repository_impl.dart';
import 'package:artdesign/app/domain/repositories/article_repository.dart';
import 'package:artdesign/app/domain/repositories/event_repository.dart';
import 'package:artdesign/app/domain/repositories/featured_professional_repository.dart';
import 'package:artdesign/app/domain/repositories/featured_project_repository.dart';
import 'package:artdesign/app/domain/repositories/sliders_repository.dart';
import 'package:artdesign/app/domain/usecases/article/get_local_article.dart';
import 'package:artdesign/app/domain/usecases/event/get_local_event.dart';
import 'package:artdesign/app/domain/usecases/professional/get_local_featured_professional.dart';
import 'package:artdesign/app/domain/usecases/projects/get_local_fetured_project.dart';
import 'package:artdesign/app/domain/usecases/sliders/get_sliders.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';

import 'app/core/network/network_info.dart';
import 'app/data/api/api.dart';
import 'app/data/datasources/remote/sliders_datasource.dart';

part 'injector.g.dart';

abstract class Injector {
  static KiwiContainer container = KiwiContainer();

  static final resolve = container.resolve;

  static void setup() {
    container = KiwiContainer();
    _$Injector().configure();
  }

  void configure() {
    configureCore();
    configureFeatureModule();
  }

  // Core module
  @Register.singleton(Connectivity)
  @Register.singleton(NetworkInfoI, from: NetworkInfo)
  void configureCore();

  // Feature module instances
  void configureFeatureModuleInstances() {
    container.registerInstance(
        RestClient(Dio(BaseOptions(contentType: "application/json"))));
  }

  //Feature module
  void configureFeatureModule() {
    configureFeatureModuleInstances();
    configureBannerFeatureModuleFactories();
    configureFeaturedProjectsFeatureModuleFactories();
    configureFeaturedProfessionalFeatureModuleFactories();
    configureEventFeatureModuleFactories();
    configureArticleFeatureModuleFactories();
  }

  // Sliders Feature module factories
  @Register.factory(SlidersRemoteDatasource)
  @Register.factory(SlidersRepository, from: SlidersRepositoryImpl)
  @Register.factory(GetRemoteSliders)
  void configureBannerFeatureModuleFactories();

  // Featured Project module factories
  @Register.factory(FeaturedProjectsDatasource)
  @Register.factory(FeaturedProjectRepository,
      from: FeaturedProjectRepositoryImpl)
  @Register.factory(GetLocalFeaturedProjects)
  void configureFeaturedProjectsFeatureModuleFactories();

  // Featured Professional module factories
  @Register.factory(FeaturedProfessionalDatasource)
  @Register.factory(FeaturedProfessionalRepository,
      from: FeaturedProfessionalRepositoryImpl)
  @Register.factory(GetLocalFeaturedProfessional)
  void configureFeaturedProfessionalFeatureModuleFactories();

  // Featured Professional module factories
  @Register.factory(EventDatasource)
  @Register.factory(EventRepository, from: EventRepositoryImpl)
  @Register.factory(GetLocalEvent)
  void configureEventFeatureModuleFactories();

  // Featured Article
  @Register.factory(ArticleDatasource)
  @Register.factory(ArticleRepository, from: ArticleRepositoryImpl)
  @Register.factory(GetLocalArticle)
  void configureArticleFeatureModuleFactories();
}
