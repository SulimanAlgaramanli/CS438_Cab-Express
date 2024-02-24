class States {
  final String? messages;
  final bool isLoading;
  final bool isError;
  final bool isSuccess;
  static const empty = States();

  const States({
    this.isLoading = false,
    this.isError = false,
    this.isSuccess = false,
    this.messages,
  });

  States.loading()
      : isLoading = true,
        isError = false,
        isSuccess = false,
        messages = null;

  States.success([this.messages])
      : isLoading = false,
        isError = false,
        isSuccess = true;

  States.error([this.messages])
      : isLoading = false,
        isError = true,
        isSuccess = false;

  States copyWith({
    String? messages,
    bool? isLoading,
    bool? isError,
    bool? isSuccess,
  }) {
    return States(
      messages: messages ?? messages,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
