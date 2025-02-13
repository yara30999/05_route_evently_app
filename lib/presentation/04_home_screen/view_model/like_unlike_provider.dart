import 'package:flutter/material.dart';
import '../../../domain/usecase/toggle_favourite_usecase.dart';

class LikeUnlikeProvider extends ChangeNotifier {
  final ToggleFavouriteUsecase _toggleFavouriteUsecase;

  LikeUnlikeProvider(this._toggleFavouriteUsecase);

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

  Future<void> toggle({required String eventId, required bool isliked}) async {
    _setLoading(true);
    final result = await _toggleFavouriteUsecase
        .execute(ToggleFavouritesUseCaseInput(eventId, isliked));
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
