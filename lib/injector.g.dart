// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Injector extends Injector {
  @override
  void configureCore() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton((c) => Connectivity())
      ..registerSingleton<NetworkInfoI>(
          (c) => NetworkInfo(connectivity: c<Connectivity>()));
  }

  @override
  void configureBannerFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => SlidersRemoteDatasource(client: c<RestClient>()))
      ..registerFactory<SlidersRepository>((c) => SlidersRepositoryImpl(
          slidersDatasource: c<SlidersRemoteDatasource>()))
      ..registerFactory((c) => GetRemoteSliders(c<SlidersRepository>()));
  }

  @override
  void configureFeaturedProjectsFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => FeaturedProjectsDatasource())
      ..registerFactory<FeaturedProjectRepository>((c) =>
          FeaturedProjectRepositoryImpl(
              projectDatasource: c<FeaturedProjectsDatasource>()))
      ..registerFactory(
          (c) => GetLocalFeaturedProjects(c<FeaturedProjectRepository>()));
  }

  @override
  void configureFeaturedProfessionalFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => FeaturedProfessionalDatasource())
      ..registerFactory<FeaturedProfessionalRepository>((c) =>
          FeaturedProfessionalRepositoryImpl(
              professionalDatasource: c<FeaturedProfessionalDatasource>()))
      ..registerFactory((c) =>
          GetLocalFeaturedProfessional(c<FeaturedProfessionalRepository>()));
  }

  @override
  void configureEventFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => EventDatasource())
      ..registerFactory<EventRepository>(
          (c) => EventRepositoryImpl(eventDatasource: c<EventDatasource>()))
      ..registerFactory((c) => GetLocalEvent(c<EventRepository>()));
  }

  @override
  void configureArticleFeatureModuleFactories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory((c) => ArticleDatasource())
      ..registerFactory<ArticleRepository>((c) =>
          ArticleRepositoryImpl(articleDatasource: c<ArticleDatasource>()))
      ..registerFactory((c) => GetLocalArticle(c<ArticleRepository>()));
  }
}
