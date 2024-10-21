import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kings_store/Blocs/bloc_onboarding/onboarding_event.dart';
import 'package:kings_store/Blocs/bloc_onboarding/onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final int totalPages;

  OnboardingBloc({required this.totalPages}) : super(OnboardingInitial());

  @override
  Stream<OnboardingState> mapEventToState(OnboardingEvent event) async* {
    if (event is OnPageChanged) {
      yield OnboardingInitial(currentIndex: event.index);
    } else if (event is OnNextButtonPressed) {
      final currentIndex = (state as OnboardingInitial).currentIndex;
      if (currentIndex < totalPages - 1) {
        yield OnboardingInitial(currentIndex: currentIndex + 1);
      } else {
        yield OnboardingCompleted();
      }
    }
  }
}
