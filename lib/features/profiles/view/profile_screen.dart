import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/core/utils/constants/colors.dart';
import 'package:hotel_booking/core/utils/widgets/icon_box.dart';
import 'package:hotel_booking/features/profiles/widgets/settings_item.dart';

class SettingPage extends ConsumerStatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends ConsumerState<SettingPage> {
  // late UserModel user;

  // final LogoutController logoutController = LogoutController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // final user = ref.read(userNotifierProvider.notifier).getUser;
    return Scaffold(
      backgroundColor: appBgColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: appBarColor,
            pinned: true,
            snap: true,
            floating: true,
            title: getAppBar(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => buildBody(),
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget getAppBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Setting",
                  style: TextStyle(
                    color: textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          IconBox(
            child: SvgPicture.asset(
              "assets/icons/edit.svg",
              width: 18,
              height: 18,
            ),
            bgColor: appBgColor,
          ),
        ],
      ),
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.only(right: 20, top: 10),
      child: Column(
        children: [
          // UserComponent(ref: ref),
          SizedBox(height: 40),
          SettingItem(
            title: "General Setting",
            leadingIcon: Icons.settings,
            leadingIconColor: orange,
            onTap: () {
              // Navigator.pushNamed(context, AppRoutes.generalSettings);
            },
          ),
          SizedBox(height: 10),
          SettingItem(
            title: "Historique de transaction",
            leadingIcon: Icons.settings,
            leadingIconColor: orange,
            onTap: () {
              //Navigator.pushNamed(context, AppRoutes.historyTransactionPage);
            },
          ),
          SizedBox(height: 10),
          SettingItem(
            title: "Favorites",
            leadingIcon: Icons.favorite,
            leadingIconColor: red,
            onTap: () {
              // Navigator.pushNamed(context, AppRoutes.favoritesPage);
            },
          ),
          SizedBox(height: 10),
          SettingItem(
            title: "Privacy",
            leadingIcon: Icons.privacy_tip_outlined,
            leadingIconColor: green,
            onTap: () {
              // Navigator.pushNamed(context, AppRoutes.privacyPage);
            },
          ),
          SizedBox(height: 10),
          SettingItem(
            title: "Log Out",
            leadingIcon: Icons.logout_outlined,
            leadingIconColor: Colors.grey.shade400,
            onTap: () {
              showConfirmLogout();
            },
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  showConfirmLogout() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        message: Text("Would you like to log out?"),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.of(context).pop();
              //  await logoutController.logout(ref);
            },
            child: Text("Log Out", style: TextStyle(color: actionColor)),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
