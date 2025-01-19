import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:uianprt/controller/bindings.dart';
import 'package:uianprt/model/consts.dart';
import 'package:uianprt/model/storagedb/cameras.dart';
import 'package:uianprt/model/storagedb/registredDb.dart';
import 'package:uianprt/model/storagedb/setting.dart';
import 'package:uianprt/model/storagedb/users.dart';
import 'package:uianprt/screens/loginScreen.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final config = await loadConfig();

  path = config['db_path']!;
  imagesPath = config['images_folder_path']!;
  tz.initializeTimeZones();

  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  Hive.registerAdapter(UsersAdapter());
  await Hive.openBox<Users>('userbox');
  Hive.registerAdapter(RegistredDbAdapter());
  await Hive.openBox<RegistredDb>('regbox');
  Hive.registerAdapter(CamerasAdapter());
  await Hive.openBox<Cameras>('camerabox');
  Hive.registerAdapter(SettingAdapter());
  await Hive.openBox<Setting>('settingbox');

  //Clean Up Code Refactor all codes and remove duplicate code


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        builder: (context, child) {
          return ResponsiveBreakpoints.builder(child: child!, breakpoints: []);
        },
        initialBinding: MyBinding(),
        theme: ThemeData(fontFamily: 'byekan', useMaterial3: true),
        debugShowCheckedModeBanner: false,
        title: 'AmnAfarin',
        onReady: () async {
          printIps();

        },
        home: ModernLoginPage());
  }
}
