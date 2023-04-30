import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:umeas/core/assets/image_assets.dart';
import 'package:umeas/core/constants/screen_constants.dart';
import 'package:umeas/core/extensions/buildcontext/loc.dart';
import 'package:umeas/core/mixins/overlay_mixin.dart';
import 'package:umeas/core/presentation/routes/route_manager.dart';
import 'package:umeas/core/presentation/styles/app_text_styles.dart';
import 'package:umeas/features/inbox/presentation/pages/inbox_page.dart';

import '../../../features/auth/presentation/bloc/auth/auth_bloc.dart';
import '../../../injection_container.dart';
import '../../enums/menu_action.dart';
import '../colors/app_colors.dart';
import 'dialogs/logout_dialog.dart';

class TopAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const TopAppBar({super.key, required this.title});

  @override
  State<StatefulWidget> createState() => _TopAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TopAppBarState extends State<TopAppBar>
    with OverlayStateMixin<TopAppBar> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) {
        final authBloc = sl<AuthBloc>();
        authBloc.add(AuthInitializeEvent());
        return authBloc;
      },
      child: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ImageAssets.kUmeasPath,
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Text(widget.title, style: AppTextStyles.headline5),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.inbox),
          onPressed: () {
            toggleOverlay(const InboxPage());
          },
        ),
        actions: [
          PopupMenuButton<MenuAction>(
            onSelected: (value) async {
              switch (value) {
                case MenuAction.logout:
                  final shouldLogout = await showLogOutDialog(context);
                  if (shouldLogout) {
                    // ignore: use_build_context_synchronously
                    context.read<AuthBloc>().add(
                          AuthLogOutEvent(),
                        );
                  }
                  break;
                case MenuAction.settings:
                  Navigator.of(context).pushNamed(Routes.settings);
                  break;
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem<MenuAction>(
                  value: MenuAction.logout,
                  child: Text(context.loc.logout_button),
                ),
                PopupMenuItem<MenuAction>(
                  value: MenuAction.settings,
                  child: Text(context.loc.settings_button),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }
}
