class Historymasseges {
	int? id;
	int? conversationId;
	int? senderId;
	String? senderName;
	dynamic senderAvatar;
	String? body;
	String? type;
	String? attachment;
	bool? isMine;
	String? createdAt;

	Historymasseges({
		this.id, 
		this.conversationId, 
		this.senderId, 
		this.senderName, 
		this.senderAvatar, 
		this.body, 
		this.type, 
		this.attachment,
		this.isMine,
		this.createdAt, 
	});

	factory Historymasseges.fromJson(Map<String, dynamic> json) {
		return Historymasseges(
			id: json['id'] as int?,
			conversationId: json['conversation_id'] as int?,
			senderId: json['sender_id'] as int?,
			senderName: json['sender_name'] as String?,
			senderAvatar: json['sender_avatar'] as dynamic,
			body: json['body'] as String?,
			type: json['type'] as String?,
			attachment: _extractAttachment(json),
			isMine: json['is_mine'] as bool?,
			createdAt: json['created_at'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'id': id,
				'conversation_id': conversationId,
				'sender_id': senderId,
				'sender_name': senderName,
				'sender_avatar': senderAvatar,
				'body': body,
				'type': type,
				'attachment': attachment,
				'is_mine': isMine,
				'created_at': createdAt,
			};
}

String? _extractAttachment(Map<String, dynamic> json) {
	final attachment = json['attachment'];
	if (attachment is String && attachment.isNotEmpty) {
		return attachment;
	}
	final attachmentUrl = json['attachment_url'];
	if (attachmentUrl is String && attachmentUrl.isNotEmpty) {
		return attachmentUrl;
	}
	if (attachment is Map<String, dynamic>) {
		final url = attachment['url'] ?? attachment['path'];
		if (url is String && url.isNotEmpty) {
			return url;
		}
	}
	return null;
}
