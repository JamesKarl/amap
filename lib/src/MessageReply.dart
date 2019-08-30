class MessageReply {
  final String methodId;
  final bool success;
  final String message;
  final dynamic data;

  const MessageReply({this.methodId, this.success, this.message, this.data});

  const MessageReply.error(String message)
      : this(methodId: "???", success: false, message: message, data: null);
}
