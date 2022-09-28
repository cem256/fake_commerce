import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extensions/context_extensions.dart';
import '../../../logic/blocs.dart';
import '../../router/app_router.gr.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: context.paddingAllDefault,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Display",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w700),
            ),
            const _ThemeTile(),
            SizedBox(
              height: context.mediumValue,
            ),
            Text(
              "Account",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(fontWeight: FontWeight.w700),
            ),
            const _ChangePasswordTile(),
            const _DeleleteAccounTile(),
            const _LogoutTile(),
          ],
        ),
      ),
    );
  }
}

class _ThemeTile extends StatelessWidget {
  const _ThemeTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.brightness_medium),
      title: const Text("Theme"),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Padding(
                padding: context.paddingAllDefault,
                child: BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Choose Theme",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text("System Default"),
                          value: ThemeMode.system,
                          groupValue: state.settingsValue ?? state.theme,
                          onChanged: (ThemeMode? theme) => context.read<ThemeBloc>().add(ThemeTileChanged(theme!)),
                        ),
                        RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text("Light"),
                          value: ThemeMode.light,
                          groupValue: state.settingsValue ?? state.theme,
                          onChanged: (ThemeMode? theme) => context.read<ThemeBloc>().add(ThemeTileChanged(theme!)),
                        ),
                        RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text("Dark"),
                          value: ThemeMode.dark,
                          groupValue: state.settingsValue ?? state.theme,
                          onChanged: (ThemeMode? theme) => context.read<ThemeBloc>().add(ThemeTileChanged(theme!)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => context.router.pop(),
                              child: const Text("CANCEL"),
                            ),
                            TextButton(
                              onPressed: () {
                                context.read<ThemeBloc>().add(ThemeChanged());
                                context.router.pop();
                              },
                              child: const Text("OK"),
                            )
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _ChangePasswordTile extends StatelessWidget {
  const _ChangePasswordTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.password),
      title: const Text("Change Password"),
      onTap: () => context.router.push(const ChangePasswordRoute()),
    );
  }
}

class _DeleleteAccounTile extends StatelessWidget {
  const _DeleleteAccounTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const Icon(Icons.delete),
        title: const Text("Delete Account"),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: Padding(
                  padding: context.paddingAllDefault,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Delete Account",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: context.mediumValue,
                      ),
                      const Text(
                        "Are you sure you want to delete your account? You cannot undo this operation!",
                      ),
                      SizedBox(
                        height: context.mediumValue,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => context.router.pop(),
                            child: const Text("CANCEL"),
                          ),
                          TextButton(
                            onPressed: () => context.read<SettingsBloc>().add(AccountDeletionRequested()),
                            child: const Text("OK"),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}

class _LogoutTile extends StatelessWidget {
  const _LogoutTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const Icon(Icons.logout),
      title: const Text("Logout"),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: Padding(
                padding: context.paddingAllDefault,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Logout",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(
                      height: context.mediumValue,
                    ),
                    const Text(
                      "Are you sure you want to logout?",
                    ),
                    SizedBox(
                      height: context.mediumValue,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => context.router.pop(),
                          child: const Text("CANCEL"),
                        ),
                        TextButton(
                          onPressed: () => context.read<SettingsBloc>().add(LogoutRequested()),
                          child: const Text("OK"),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
