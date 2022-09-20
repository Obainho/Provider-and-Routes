import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/settings_data.dart';
import '../models/user.dart';
import '../routes/routes.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building MainPage');
    return Consumer<SettingsData>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: context.watch<SettingsData>().appBarColor,
            automaticallyImplyLeading: false,
            title: const Text('Main Screen'),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(RouteManager.settingsPage);
                },
                icon: const Icon(Icons.settings),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.exit_to_app),
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<User>(
                  builder: (context, value, child) {
                    return Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                            text: "Welcome ",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: value.username,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: context.watch<SettingsData>().appBarColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
