class States {
  final String? messages;
  final bool isLoading;
  final bool isError;
  final bool isSuccess;

  const States({
    this.isLoading = false,
    this.isError = false,
    this.isSuccess = false,
    this.messages,
  });

  States copyWith({
    String? messages,
    bool? isLoading,
    bool? isError,
    bool? isSuccess,
  }) {
    return States(
      messages: messages ?? this.messages,
      isLoading: isLoading ?? this.isLoading,
      isError: isError ?? this.isError,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}
