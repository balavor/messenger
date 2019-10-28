export type Events = {
    connectUser: { userId: string; name: string }
    createChat: { userId: string; chatId: string }
    joinChat: { userId: string; chatId: string }
    messageSent: { userId: string; chatId: string; text: string }
    userViewedMessage: {userId: string, messageId: string }
    disonnectUser: { userId: string; name: string }
}

export type Effects = {
    userConnected: { userId: string; name: string }
    usersListUpdated: { userId: string; name: string }[]
    newChatCreated: { userId: string; chatId: string; title: string }
    userJoinedChat: { userId: string; chatId: string }
    newMessage: { userId: string; chatId: string; text: string }
    userDisonnected: { userId: string; name: string }
}

export type EffectMessage<E extends keyof Effects> = {
    type: E
    effect: Effects[E]
}

export type EventMessage<E extends keyof Events> = {
    type: E
    event: Events[E]
}
