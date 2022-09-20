import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/settings_data.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building Settings');
    return Consumer<SettingsData>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: value.appBarColor,
            title: const Text('Settings'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<SettingsData>(
                  builder: (context, value, child) {
                    return Text(
                      'Choose color scheme for AppBar',
                      style: TextStyle(
                        color: value.appBarColor,
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    value.appBarColor = Colors.blue;
                  },
                  child: const Text('Blue'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                  ),
                  onPressed: () {
                    value.appBarColor = Colors.purple;
                  },
                  child: const Text('Purple'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
