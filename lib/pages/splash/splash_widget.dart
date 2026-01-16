import '/auth/base_auth_user_provider.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'splash_model.dart';
export 'splash_model.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  static String routeName = 'Splash';
  static String routePath = '/splash';

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  late SplashModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (loggedIn) {
        if (await getPermissionStatus(locationPermission)) {
          await Future.delayed(
            Duration(
              milliseconds: 4000,
            ),
          );
          _model.latlang = await actions.getAndRequestLocation();
          if (Navigator.of(context).canPop()) {
            context.pop();
          }
          context.pushNamed(HomePageWidget.routeName);
        } else {
          await Future.delayed(
            Duration(
              milliseconds: 4000,
            ),
          );
          if (Navigator.of(context).canPop()) {
            context.pop();
          }
          context.pushNamed(EnableLocationWidget.routeName);
        }
      } else {
        if (await getPermissionStatus(locationPermission)) {
          await Future.delayed(
            Duration(
              milliseconds: 4000,
            ),
          );
          _model.latlngOff = await actions.getAndRequestLocation();
          if (Navigator.of(context).canPop()) {
            context.pop();
          }
          context.pushNamed(PhoneSignUpWidget.routeName);
        } else {
          await Future.delayed(
            Duration(
              milliseconds: 4000,
            ),
          );
          if (Navigator.of(context).canPop()) {
            context.pop();
          }
          context.pushNamed(EnableLocationWidget.routeName);
        }
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          resizeToAvoidBottomInset: false,
          backgroundColor: FlutterFlowTheme.of(context).primary,
          body: SafeArea(
            top: true,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/lalafang.png',
                    width: 100.0,
                    height: 80.0,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
