export type Events = {
    connectUser: { name: string }
    createChat: { userId: string; title: string }
    joinChat: { userId: string; chatId: string }
    messageSent: { userId: string; chatId: string; text: string }
    userViewedMessage: { userId: string; messageId: string }
    disonnectUser: { userId: string }
}

export type Effects = {
    userConnected: { userId: string; name: string }
    usersListUpdated: { userId: string; name: string }[]
    newChatCreated: { authorId: string; chatId: string; title: string; users: string[] }
    userJoinedChat: { userId: string; chatId: string }
    newMessage: { userId: string; chatId: string; text: string }
    userDisonnected: { userId: string }

    updateMessageState: { messageId: string; viewedBy: string[] }
    updateUsersList: { users: string[] }
}

export type EffectMessage<E extends keyof Effects> = {
    type: E
    effect: Effects[E]
}

export type EventMessage<E extends keyof Events> = {
    type: E
    event: Events[E]
}
