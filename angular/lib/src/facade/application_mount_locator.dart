import 'dart:html';

/// Provides Angular a way to locate the root component's element
///
/// The default mechanic uses `document.querySelector` for the
/// root component's selector to find the Element which will be the application's
/// root element.
///
/// To override:
///
/// ```
/// import 'package:angular/angular.dart';
///
/// class MyApplicationMountLocator implements ApplicationMountLocator {
///   @override
///   Element locateMountElement(String componentSelector) {
///     return Element.tag('some-element');
///   }
/// }
///
/// void main() {
///   bootstrap(MyApp, [
///     provide(ApplicationMountLocator, useClass: MyApplicationMountLocator),
///   ]);
/// }
/// ```
abstract class ApplicationMountLocator {
  Element locateMountElement(String componentSelector);

  factory ApplicationMountLocator.byComponentSelector() =>
      _SelectorMountLocator();
}

class _SelectorMountLocator implements ApplicationMountLocator {
  @override
  Element locateMountElement(String componentSelector) {
    return document.querySelector(componentSelector);
  }
}
