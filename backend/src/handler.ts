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
        connectUser: (event) => {
            emit("userConnected", {
                name: state
            })
        },
        chatCreated: (_event) => {},
        joinedChat: (_event) => {},
        messageSent: (_event) => {},
        userViewedMessage: (_event) => {}
    }
}