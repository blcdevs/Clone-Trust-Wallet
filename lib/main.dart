import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clone_trust/app/bloc/crypto_asset_cubit.dart';
import 'package:clone_trust/app/bloc/live_prices_cubit.dart';
import 'package:clone_trust/app/ui/dashboard_page.dart';
import 'package:clone_trust/repository/repository.dart';
import 'package:clone_trust/utils/app_routes.dart';
import 'package:clone_trust/utils/initialize_dependency.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (BuildContext context) =>
              CryptoAssetCubit(injector.get<IRepository>()),
        ),
        BlocProvider(create: (BuildContext context) => LivePricesCubit())
      ], child: const DashboardPage()),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
