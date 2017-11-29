import 'dart:html';
import 'package:angular/angular.dart';

@Component(
  selector: 'queries',
  directives: const [
    AnotherDirective,
    NgIf,
  ],
  template: r'''
    <ng-content></ng-content>
    <another #q1></another>
    <another #q2></another>
    <another #q3 *ngIf="someValue"></another>
  ''',
)
class QueriesComponent {
  bool someValue = false;

  @ContentChildren(AnotherDirective)
  QueryList<AnotherDirective> contentChildrenFromField;

  @ContentChild(AnotherDirective)
  AnotherDirective contentChildFromField;

  @ViewChildren('q2')
  QueryList<AnotherDirective> viewChildrenFromField;

  @ViewChild('q2')
  AnotherDirective viewChildFromField;

  @ViewChild('q2', read: ElementRef)
  ElementRef readDIFromElementRef;

  @ViewChild('q2', read: Element)
  Element readDIFromElement;

  @ViewChild('q2', read: HtmlElement)
  HtmlElement readDIFromHtmlElement;

  @ViewChildren(AnotherDirective)
  QueryList<AnotherDirective> usingTypeFromField;
}

@Component(
  selector: 'test',
  directives: const [
    AnotherDirective,
  ],
  template: r'''
    <another></another>
    <template>
      <another></another>
    </template>
    <template>
      <another></another>
    </template>
  ''',
)
class EmbeddedQueries {
  @ViewChildren(AnotherDirective)
  QueryList viewChildren;
}

@Directive(selector: 'another')
class AnotherDirective {}
