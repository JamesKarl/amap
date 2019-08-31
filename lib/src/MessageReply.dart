class MessageReply {
  final String methodId;
  final bool success;
  final String message;
  final dynamic data;

  const MessageReply({
    this.methodId = "???",
    this.success = false,
    this.message = "",
    this.data,
  });

  const MessageReply.error(String methodId, String message)
      : this(
          methodId: methodId ?? "???",
          success: false,
          message: message,
          data: null,
        );
}
