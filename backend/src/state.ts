import uuid = require("uuid")

type User = {
    id: string
    name: string
    chatIds: string[]
    isConnected: boolean
}

type Message = {
    id: string
    text: string
    chatId: string
    authorId: string
    messageViewedBy: string[]
    type: "message" | "system"
    date: Date
}

type Chat = {
    id: string
    title: string
    users: string[]
    authorId: string
    messageIds: string[]
}

export class State {
    private users: {
        [id: string]: User
    } = {}

    private chats: {
        [id: string]: Chat
    } = {}

    private messages: {
        [id: string]: Message
    } = {}

    connectUser(id: string, name: string) {
        if (this.users[id] === undefined) {
            this.users[id] = {
                id,
                chatIds: [],
                isConnected: true,
                name,
            }
        }
        this.users[id].isConnected = true
    }
    createChat(userId: string, title: string) {
        const chatWithSameTitle = Object.keys(this.chats).find(key => this.chats[key].title === title)
        if (chatWithSameTitle !== undefined) return "exists"
        const chatId = uuid()
        this.chats[chatId] = {
            authorId: userId,
            id: chatId,
            title: title,
            users: [userId],
            messageIds: []
        }
        return "success"
    }
    joinedChat(userId: string, chatId: string) {
        this.chats[chatId].users.push(userId)
    }
    messageSent(userId: string, chatId: string, text: string) {
        const messageId = uuid()
        this.messages[messageId] = {
            authorId: userId,
            chatId: chatId,
            id: messageId,
            text,
            messageViewedBy: [],
            type: "message",
            date: new Date()
        }
        this.chats[chatId].messageIds.push(messageId)
    }
}
