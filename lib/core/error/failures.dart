import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../network/status_code.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');

      case DioExceptionType.unknown:
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        return ServerFailure('Opps There was an Error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == StatusCode.badRequest ||
        statusCode == StatusCode.unauthorized ||
        statusCode == StatusCode.forbidden ||
        statusCode == StatusCode.unprocessable) {
      if (response['errors'] is Map<String, dynamic>) {
        Map<String, dynamic> error = response['errors'];
        return ServerFailure(error.values.first[0]);
      } else if (response['message'] is String) {
        return ServerFailure(response['message']);
      } else if (response['message'] is Map<String, dynamic>) {
        Map<String, dynamic> error = response['message'];
        return ServerFailure(error.values.first[0]);
      } else {
        return ServerFailure('Opps There was an Error, Please try again');
      }
    } else if (statusCode == StatusCode.notFound) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == StatusCode.internalServerError) {
      return ServerFailure('Internal Server error, Please try later');
    } else {
      return ServerFailure('Opps There was an Error, Please try again');
    }
  }
}

class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure(super.errMessage);

  factory FirebaseAuthFailure.fromFirebaseException(
    FirebaseAuthException exception,
  ) {
    switch (exception.code) {
      case 'network-request-failed':
        return FirebaseAuthFailure(
          'No Internet Connection. Please check your network and try again.',
        );

      case 'user-disabled':
        return FirebaseAuthFailure(
          'This account has been disabled by an administrator.',
        );

      case 'user-not-found':
        return FirebaseAuthFailure(
          'No user found with these credentials. Please try again.',
        );

      case 'wrong-password':
        return FirebaseAuthFailure('Incorrect password. Please try again.');

      case 'email-already-in-use':
        return FirebaseAuthFailure(
          'This email address is already in use by another account.',
        );

      case 'invalid-email':
        return FirebaseAuthFailure(
          'The email address is not valid. Please enter a valid email.',
        );

      case 'account-exists-with-different-credential':
        return FirebaseAuthFailure(
          'An account already exists with the same email address but different sign-in credentials. Please use a different method.',
        );

      case 'credential-already-in-use':
        return FirebaseAuthFailure(
          'This credential is already associated with a different user account.',
        );

      case 'operation-not-allowed':
        return FirebaseAuthFailure(
          'This sign-in method is not allowed. Please contact support.',
        );

      case 'invalid-credential':
        return FirebaseAuthFailure(
          'The credential provided is invalid or expired. Please try again.',
        );

      case 'expired-action-code':
        return FirebaseAuthFailure(
          'The action code has expired. Please restart the process.',
        );

      case 'weak-password':
        return FirebaseAuthFailure(
          'The password is too weak. Please use a stronger password.',
        );

      default:
        return FirebaseAuthFailure(
          'An unexpected error occurred: ${exception.message ?? "Please try again later."}',
        );
    }
  }

  factory FirebaseAuthFailure.fromSignInMethod(
    String method,
    String errorCode,
  ) {
    switch (method) {
      case 'google':
        return FirebaseAuthFailure.fromGoogleError(errorCode);
      case 'facebook':
        return FirebaseAuthFailure.fromFacebookError(errorCode);
      case 'apple':
        return FirebaseAuthFailure.fromAppleError(errorCode);
      default:
        return FirebaseAuthFailure(
          'Sign-in failed. Please try again using a different method.',
        );
    }
  }

  factory FirebaseAuthFailure.fromGoogleError(String errorCode) {
    switch (errorCode) {
      case 'popup-closed-by-user':
        return FirebaseAuthFailure('Sign-in process was canceled by the user.');
      case 'account-exists-with-different-credential':
        return FirebaseAuthFailure(
          'An account with this email already exists using a different sign-in method.',
        );
      default:
        return FirebaseAuthFailure('Google sign-in failed. Please try again.');
    }
  }

  factory FirebaseAuthFailure.fromFacebookError(String errorCode) {
    switch (errorCode) {
      case 'access-denied':
        return FirebaseAuthFailure('Facebook access was denied.');
      case 'account-exists-with-different-credential':
        return FirebaseAuthFailure(
          'An account with this email already exists using a different sign-in method, please try to sign-in using google.',
        );
      default:
        return FirebaseAuthFailure(
          'Facebook sign-in failed. Please try again.',
        );
    }
  }

  factory FirebaseAuthFailure.fromAppleError(String errorCode) {
    switch (errorCode) {
      case 'canceled':
        return FirebaseAuthFailure(
          'Apple sign-in process was canceled by the user.',
        );
      case 'invalid-credential':
        return FirebaseAuthFailure('Apple sign-in credential is invalid.');
      default:
        return FirebaseAuthFailure('Apple sign-in failed. Please try again.');
    }
  }
}
