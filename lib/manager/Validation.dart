import 'dart:async';

mixin Validation {
  static bool isEmail(String email) => email.contains('@');

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) {
        if (isEmail(value)) {
          return sink.add(value);
        }

        return sink.addError('must be a valid email');
      }
  );

  final validateSubject = StreamTransformer<String, String>.fromHandlers(
      handleData: (value, sink) {
          int len = value.length;
          if (len == 0) return sink.addError( "`SUBJECT` cannot be empty");
          if (len < 4) return sink.addError("`SUBJECT` must be longer than 4 characters");
          return sink.add(value);
      }
  );
}