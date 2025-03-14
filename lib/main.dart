import 'package:change_notifier_theme/presentation/controllers/theme_controller.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

final themeController = ThemeController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeController,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: themeController.isDarkTheme ? ThemeData.dark() : ThemeData.light(),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ChangeNotifierTheme"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Trocar o tema do app"),
              AnimatedBuilder(
                animation: themeController,
                builder: (context, child) {
                  return Switch(
                      value: themeController.isDarkTheme,
                      onChanged: (value) {
                        themeController.toggleTheme();
                      });
                }
              ),
            ]),
      ),
    );
  }

}
