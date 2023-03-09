import 'dart:developer';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:theme_demo/colors.dart';
import 'package:theme_demo/golbal.dart';
import 'package:theme_demo/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Global.savedThemeMode = await AdaptiveTheme.getThemeMode();
  
  inspect(Global.savedThemeMode);
  print(Global.savedThemeMode);
  // log(AdaptiveTheme.prefKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        )
      ],
      child: Builder(
        builder: (BuildContext ctx) {
          return AdaptiveTheme(
            builder: (ThemeData light, ThemeData dark) {
              return MaterialApp(
                // themeMode: Provider.of<ThemeProvider>(ctx).themeMode,
                // darkTheme: MyTheme.darkTheme,
                theme: light,
                darkTheme: dark,
                title: 'Flutter Demo',
                home: const MyHomePage(title: 'Flutter Demo Home Page'),
              );
            },
            initial: Global.savedThemeMode ?? AdaptiveThemeMode.light,
            light: ThemeData.light(),
            dark: ThemeData.dark(),
          );
        },
        // child: MaterialApp(
        // themeMode: Provider.of<ThemeProvider>(context).themeMode,
        // title: 'Flutter Demo',
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        //   ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Color? myColor;
  @override
  void initState() {
    Future.delayed(Duration.zero, () => getColor());
    super.initState();
  }

  getColor() {
    myColor = Theme.of(context).primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ThemeProvider>(context);

    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            label: Text(
              'Demo',
            )),
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
          // actions: [
          //   Theme(
          //     data: provider.isDartMode
          //         ? ThemeData.light(useMaterial3: true)
          //         : ThemeData.dark(),
          //     child: Switch.adaptive(
          //       value: provider.isDartMode,
          //       onChanged: (value) {
          //         provider.toggleTheme(value);
          //       },
          //     ),
          //   )
          // ],
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => AdaptiveTheme.of(context).setDark(),
                style: ElevatedButton.styleFrom(
                  visualDensity:
                      const VisualDensity(horizontal: 4, vertical: 2),
                ),
                child: const Text('Set Dark'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => AdaptiveTheme.of(context).setLight(),
                style: ElevatedButton.styleFrom(
                  visualDensity:
                      const VisualDensity(horizontal: 4, vertical: 2),
                ),
                child: const Text('set Light'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () async {
                  await showColorPicker();
                  // log(myColor.toString());
                  // log(myColor.toMaterial().toString());
                  if (myColor == null) return;
                  if (mounted) {
                    AdaptiveTheme.of(context).setTheme(
                      light: ThemeData(
                        brightness: Brightness.light,
                        primarySwatch: myColor.toMaterial(),
                        // floatingActionButtonTheme: FloatingActionButtonThemeData(

                        //     backgroundColor: Theme.of(context).primaryColor),
                        // iconTheme: const IconThemeData(color: Colors.red),

                        // textTheme: TextTheme(titleLarge: TextStyle(fontSize: 15))

                        // primaryColorDark:  Theme.of(context).primaryColor,
                        // primaryColorLight:  Theme.of(context).primaryColor,

                        // #0065ff
                      ),
                      dark: ThemeData(
                        brightness: Brightness.dark,
                        primarySwatch: myColor.toMaterial(),
                        // primarySwatch: AppColors.primeryColorOne,
                        // floatingActionButtonTheme: FloatingActionButtonThemeData(
                        //     backgroundColor: AppColors.primeryColorOne),
                        iconTheme: const IconThemeData(color: Colors.red),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  visualDensity:
                      const VisualDensity(horizontal: 4, vertical: 2),
                ),
                child: const Text('Set Custom Theme'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Icon(Icons.account_box),
                  Text(
                    'Hello world!!',
                  ),
                  CircleAvatar(
                    child: Icon(
                      Icons.account_box,
                    ),
                    // backgroundColor: Theme.of(context).primaryColor,
                  ),
                  Switch(value: true, onChanged: (val) {})
                ],
              ),
            ],
          ),
        ));
  }

  showColorPicker() async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Pick a color!'),
            content: SingleChildScrollView(
              child: BlockPicker(
                pickerColor:
                    myColor ?? Theme.of(context).primaryColor, //default color
                onColorChanged: (Color color) {
                  //on color picked
                  setState(() {
                    myColor = color;
                    print('inside dailog color--> $myColor');
                  });
                },
              ),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: const Text('DONE'),
                onPressed: () {
                  Navigator.of(context).pop(true); //dismiss the color picker
                },
              ),
            ],
          );
        });
  }
}
