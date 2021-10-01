import 'package:picker/ui/pages/main/about.dart';
import 'package:picker/ui/pages/change_pass.dart';
import 'package:picker/ui/pages/main/finished_requests.dart';
import 'package:picker/ui/pages/show_photo.dart';
import 'package:picker/ui/pages/main/user_info.dart';
import 'package:picker/ui/pages/sign_in.dart';
import 'package:picker/util/fade_route.dart';
import 'package:picker/ui/pages/main/home.dart';
import 'package:picker/ui/pages/chat.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: RouteSettings(
            name: '/',
            isInitialRoute: true,
          ),
          builder: (_) => HomePage(),
        );
      case '/signin':
        return FadeRoute(
          settings: RouteSettings(
            name: '/signin',
            isInitialRoute: false,
          ),
          page: SignInPage(),
        );
      case '/finished_requests':
        return FadeRoute(
          settings: RouteSettings(
            name: '/finished_requests',
            isInitialRoute: false,
          ),
          page: RequestHistoryPage(),
        );
      case '/chat':
        if (args is Map) {
          return FadeRoute(
            settings: RouteSettings(
                name: '/chat',
                isInitialRoute: false,
                arguments: args['donorId']),
            page: ChatPage(request: args),
          );
        }
        return _errorRoute();
      case '/user_information':
        return FadeRoute(
          page: UserInfoPage(),
          settings: RouteSettings(
            name: '/user_information',
            isInitialRoute: false,
          ),
        );
      case '/show_photo':
        if (args is Map)
          return FadeRoute(
            settings: RouteSettings(
              name: '/show_photo',
              isInitialRoute: false,
            ),
            page: ShowPhotoPage(args),
          );
        return _errorRoute();
      case '/about': 
        return FadeRoute(
          settings: RouteSettings(
            name: '/about',
            isInitialRoute: false,
          ),
          page: AboutPage(),
        );
      case '/change_pass': 
        return FadeRoute(
          settings: RouteSettings(
            name: '/change_pass',
            isInitialRoute: false,
          ),
          page: ChangePasswordPage(),
        );
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return FadeRoute(
      settings: RouteSettings(
        name: '/error',
        isInitialRoute: false,
      ),
      page: Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      ),
    );
  }
}
