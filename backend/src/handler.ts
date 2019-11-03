import { Events, Effects } from './events'
import { State } from './state'

export type EmitEffect = {
    <E extends keyof Effects>(type: E, effect: Effects[E]): void
}

export type EventHandler<E extends keyof Events> = {
    (event: Events[E]): void
}

export type Handler = {
    [E in keyof Events]?: EventHandler<E>
}

export function handler(state: State, emit: EmitEffect): Handler {
    return {
        connectUser: event => {
            const userId = state.connectUser(event.name)
            emit('userConnected', {
                name: event.name,
                userId: userId,
            })
        },
        createChat: event => {
            const chat = state.createChat(event.userId, event.title)
            if (!chat) throw new Error('')
            emit('newChatCreated', {
                chatId: chat.id,
                title: chat.title,
                authorId: chat.authorId,
                users: chat.users,
            })
        },
        joinChat: event => {
            state.joinChat(event.userId, event.chatId)
            emit('userJoinedChat', {
                chatId: event.chatId,
                userId: event.userId,
            })
        },
        messageSent: event => {
            state.handleNewMessage(event.userId, event.chatId, event.text)
            emit('newMessage', {
                chatId: event.chatId,
                userId: event.userId,
                text: event.text,
            })
        },
        userViewedMessage: event => {
            const updatedMessage = state.handleMessageView(event.userId, event.messageId)
            if (!updatedMessage) return
            emit('updateMessageState', {
                messageId: updatedMessage.id,
                viewedBy: updatedMessage.viewedBy,
            })
        },
        disonnectUser: event => {
            state.disconnectUser(event.userId)
            emit('userDisonnected', {
                userId: event.userId,
            })
        },
    }
}
