class LastMessage {
	int? id;
	int? conversationId;
	int? senderId;
	String? senderName;
	dynamic senderAvatar;
	String? body;
	String? type;
	String? createdAt;

	LastMessage({
		this.id, 
		this.conversationId, 
		this.senderId, 
		this.senderName, 
		this.senderAvatar, 
		this.body, 
		this.type, 
		this.createdAt, 
	});

	factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
				id: json['id'] as int?,
				conversationId: json['conversation_id'] as int?,
				senderId: json['sender_id'] as int?,
				senderName: json['sender_name'] as String?,
				senderAvatar: json['sender_avatar'] as dynamic,
				body: json['body'] as String?,
				type: json['type'] as String?,
				createdAt: json['created_at'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'conversation_id': conversationId,
				'sender_id': senderId,
				'sender_name': senderName,
				'sender_avatar': senderAvatar,
				'body': body,
				'type': type,
				'created_at': createdAt,
			};
}
