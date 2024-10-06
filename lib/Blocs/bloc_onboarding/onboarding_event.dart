abstract class OnboardingEvent {}

class OnPageChanged extends OnboardingEvent {
  final int index;
  OnPageChanged(this.index);
}

class OnNextButtonPressed extends OnboardingEvent {}
