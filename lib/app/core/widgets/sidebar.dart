import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;

import '../routes/app_pages.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.only(top: 22, left: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('menu'.tr(),
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Theme.of(context).colorScheme.secondary)),
                IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.close,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ))
              ],
            ),
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: Image.asset(
              'assets/icons/ic-home.png',
              width: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            onTap: () {
              if (Get.currentRoute == Routes.dashboard) {
                Get.back();
              } else {
                Get.back();
                Get.toNamed(Routes.home);
              }
            },
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: Image.asset(
              'assets/icons/ic-products.png',
              width: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'products'.tr(),
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            onTap: () {
              if (Get.currentRoute == Routes.products) {
                Get.back();
              } else {
                Get.back();
                Get.toNamed(Routes.products);
              }
            },
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: Image.asset(
              'assets/icons/ic-groups.png',
              width: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'professional'.tr(),
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            onTap: () {
              if (Get.currentRoute == Routes.professional) {
                Get.back();
              } else {
                Get.back();
                Get.toNamed(Routes.professional);
              }
            },
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: Image.asset(
              'assets/icons/ic-menus.png',
              width: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'projects'.tr(),
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            onTap: () {
              if (Get.currentRoute == Routes.projects) {
                Get.back();
              } else {
                Get.back();
                Get.toNamed(Routes.projects);
              }
            },
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: Image.asset(
              'assets/icons/ic-house.png',
              width: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'inspiration'.tr(),
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            onTap: () {
              if (Get.currentRoute == Routes.inspiration) {
                Get.back();
              } else {
                Get.back();
                Get.toNamed(Routes.inspiration);
              }
            },
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: Image.asset(
              'assets/icons/ic-events.png',
              width: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'events'.tr(),
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            onTap: () {
              if (Get.currentRoute == Routes.events) {
                Get.back();
              } else {
                Get.back();
                Get.toNamed(Routes.events);
              }
            },
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: Icon(
              Icons.book_rounded,
              size: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'article'.tr(),
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            onTap: () {
              if (Get.currentRoute == Routes.article) {
                Get.back();
              } else {
                Get.back();
                Get.toNamed(Routes.article);
              }
            },
          ),
          Container(
            padding: const EdgeInsets.only(top: 22, left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('about'.tr(),
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).colorScheme.secondary)),
            ),
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: Icon(
              Icons.sunny,
              color: Theme.of(context).colorScheme.secondary,
              size: 22,
            ),
            title: Text(
              'darkmode'.tr(),
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            onTap: () {
              if (Get.currentRoute == Routes.events) {
                Get.back();
              } else {
                Get.back();
                Get.toNamed(Routes.events);
              }
            },
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: Icon(
              Icons.language,
              color: Theme.of(context).colorScheme.secondary,
              size: 22,
            ),
            title: Text(
              'language'.tr(),
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            onTap: () {
              if (Get.currentRoute == Routes.events) {
                Get.back();
              } else {
                Get.back();
                Get.toNamed(Routes.events);
              }
            },
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: Icon(
              Icons.abc_outlined,
              color: Theme.of(context).colorScheme.secondary,
              size: 22,
            ),
            title: Text(
              'about'.tr(),
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            onTap: () {
              if (Get.currentRoute == Routes.events) {
                Get.back();
              } else {
                Get.back();
                Get.toNamed(Routes.events);
              }
            },
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: Icon(
              Icons.book,
              color: Theme.of(context).colorScheme.secondary,
              size: 22,
            ),
            title: Text(
              'userguid'.tr(),
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            onTap: () {
              if (Get.currentRoute == Routes.events) {
                Get.back();
              } else {
                Get.back();
                Get.toNamed(Routes.events);
              }
            },
          ),
          Container(
            padding: const EdgeInsets.only(top: 22, left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Login',
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Theme.of(context).colorScheme.secondary)),
            ),
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: Image.asset(
              'assets/icons/ic-user.png',
              width: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'loginuser'.tr(),
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            onTap: () {
              if (Get.currentRoute == Routes.events) {
                Get.back();
              } else {
                Get.back();
                Get.toNamed(Routes.events);
              }
            },
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: Image.asset(
              'assets/icons/ic-groups.png',
              width: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'loginprofessional'.tr(),
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            onTap: () {
              if (Get.currentRoute == Routes.events) {
                Get.back();
              } else {
                Get.back();
                Get.toNamed(Routes.events);
              }
            },
          ),
          ListTile(
            minLeadingWidth: 0,
            leading: Image.asset(
              'assets/icons/ic-groups.png',
              width: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
            title: Text(
              'loginsupplier'.tr(),
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.onPrimary),
            ),
            onTap: () {
              if (Get.currentRoute == Routes.events) {
                Get.back();
              } else {
                Get.back();
                Get.toNamed(Routes.events);
              }
            },
          ),
        ],
      ),
    );
  }
}
