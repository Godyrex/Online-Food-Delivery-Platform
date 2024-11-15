export class Message {
  id?: string; // Id optionnel si vous l'utilisez
  senderId: string;
  receiverId: string;
  content: string;
  timestamp: Date; // Utilisez un objet Date pour faciliter la gestion
  isRead: boolean; // Propriété ajoutée pour marquer les messages comme lus

  constructor(senderId: string, receiverId: string, content: string, timestamp: Date, isRead: boolean = false) {
    this.senderId = senderId;
    this.receiverId = receiverId;
    this.content = content;
    this.timestamp = timestamp;
    this.isRead = isRead; // Initialisation par défaut à false
  }
}
