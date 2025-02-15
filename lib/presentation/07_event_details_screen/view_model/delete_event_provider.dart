import 'package:flutter/material.dart';
import '../../../domain/usecase/delete_event_usecase.dart';

class DeleteEventProvider extends ChangeNotifier {
  final DeleteEventUsecase _deleteEventUsecase;

  DeleteEventProvider(this._deleteEventUsecase);

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setErrorMessage(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  Future<void> toggle({required String eventId}) async {
    _setLoading(true);
    final result = await _deleteEventUsecase.execute(eventId);
    result.fold(
      (failure) {
        _setErrorMessage('${failure.message} ${failure.code}');
      },
      (isSuccess) {
        _setErrorMessage(null);
        notifyListeners();
      },
    );
    _setLoading(false);
  }
}
