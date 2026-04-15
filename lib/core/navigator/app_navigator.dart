import 'package:flutter/cupertino.dart';

class AppNavigator {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  PageRoute createSlidePageRout({required Widget screen}){
    return CupertinoPageRoute(builder: (context) => screen,
    settings: const RouteSettings(),
    fullscreenDialog: false,
    maintainState: true);
  }

  PageRoute createFadePageRout({required Widget screen}){
    return PageRouteBuilder(pageBuilder: (context,animation,secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = 0.0;
      const end = 1.0;
      const curve = Curves.easeInOut;

      Animatable<double> tween = Tween(
        begin: begin,
        end: end
      ).chain(CurveTween(curve: curve));

      return FadeTransition(opacity: animation.drive(tween),child: child,);

    },);

  }

Future<void> push({required Widget screen,bool isFaded = false,})async{
  await navigatorKey.currentState!.push(
    isFaded? createFadePageRout(screen: screen) : createSlidePageRout(screen: screen)
  );
}

Future<void> pushReplacment({required Widget screen,bool isFaded = false})async{
  await navigatorKey.currentState!.pushReplacement(
    isFaded? createFadePageRout(screen: screen) : createSlidePageRout(screen: screen)
  );
}

dynamic pushAndRemoveUntil({required Widget screen,bool isFaded = false,}){
  return navigatorKey.currentState!.pushAndRemoveUntil(isFaded ? createFadePageRout(screen: screen) : createSlidePageRout(screen: screen), (rout) => false);
}

dynamic pop({dynamic object}){
  return navigatorKey.currentState!.pop<dynamic>(object);
}


}