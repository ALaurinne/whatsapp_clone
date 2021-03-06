// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ChatScreenController.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatScreenController on ChatScreenControllerBase, Store {
  final _$isTypingAtom = Atom(name: 'ChatScreenControllerBase.isTyping');

  @override
  bool get isTyping {
    _$isTypingAtom.reportRead();
    return super.isTyping;
  }

  @override
  set isTyping(bool value) {
    _$isTypingAtom.reportWrite(value, super.isTyping, () {
      super.isTyping = value;
    });
  }

  final _$messagesAtom = Atom(name: 'ChatScreenControllerBase.messages');

  @override
  ObservableList<ChatMessage> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(ObservableList<ChatMessage> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  final _$ChatScreenControllerBaseActionController =
      ActionController(name: 'ChatScreenControllerBase');

  @override
  dynamic changeTyping(bool value) {
    final _$actionInfo = _$ChatScreenControllerBaseActionController.startAction(
        name: 'ChatScreenControllerBase.changeTyping');
    try {
      return super.changeTyping(value);
    } finally {
      _$ChatScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic sendMessage(String message) {
    final _$actionInfo = _$ChatScreenControllerBaseActionController.startAction(
        name: 'ChatScreenControllerBase.sendMessage');
    try {
      return super.sendMessage(message);
    } finally {
      _$ChatScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isTyping: ${isTyping},
messages: ${messages}
    ''';
  }
}
