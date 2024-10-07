abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {
  final int currentIndex;
  OnboardingInitial({this.currentIndex = 0});
}

class OnboardingCompleted extends OnboardingState {}
