enum SetupStep {
  checkingStatus,
  downloadingRootfs,
  extractingRootfs,
  installingNode,
  installingOpenClaw,
  configuringBypass,
  complete,
  error,
}

class SetupState {
  final SetupStep step;
  final double progress;
  final String message;
  final String? messageKey; // For localization
  final Map<String, String>? messageArgs; // Arguments for localized message
  final String? error;

  const SetupState({
    this.step = SetupStep.checkingStatus,
    this.progress = 0.0,
    this.message = '',
    this.messageKey,
    this.messageArgs,
    this.error,
  });

  SetupState copyWith({
    SetupStep? step,
    double? progress,
    String? message,
    String? messageKey,
    Map<String, String>? messageArgs,
    String? error,
  }) {
    return SetupState(
      step: step ?? this.step,
      progress: progress ?? this.progress,
      message: message ?? this.message,
      messageKey: messageKey ?? this.messageKey,
      messageArgs: messageArgs ?? this.messageArgs,
      error: error,
    );
  }

  bool get isComplete => step == SetupStep.complete;
  bool get hasError => step == SetupStep.error;

  String get stepLabelKey {
    switch (step) {
      case SetupStep.checkingStatus:
        return 'checkingStatus';
      case SetupStep.downloadingRootfs:
        return 'downloadUbuntuRootfs';
      case SetupStep.extractingRootfs:
        return 'extractRootfs';
      case SetupStep.installingNode:
        return 'installNodejs';
      case SetupStep.installingOpenClaw:
        return 'installOpenClaw';
      case SetupStep.configuringBypass:
        return 'configureBionicBypass';
      case SetupStep.complete:
        return 'setupComplete';
      case SetupStep.error:
        return 'error';
    }
  }

  int get stepNumber {
    switch (step) {
      case SetupStep.checkingStatus:
        return 0;
      case SetupStep.downloadingRootfs:
        return 1;
      case SetupStep.extractingRootfs:
        return 2;
      case SetupStep.installingNode:
        return 3;
      case SetupStep.installingOpenClaw:
        return 4;
      case SetupStep.configuringBypass:
        return 5;
      case SetupStep.complete:
        return 6;
      case SetupStep.error:
        return -1;
    }
  }

  static const int totalSteps = 6;
}
