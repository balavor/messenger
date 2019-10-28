import { EventMessage, Effects } from './events'
import { handler, Handler, EmitEffect, EventHandler } from './handler'
import { State } from './state'

export class Dispatcher {
    
    handlers: EmitEffect[] = []

    state: State = new State()

    emit: EmitEffect = (type, effect) => {
        this.handlers.forEach(h => h(type, effect))
    }

    dispatch<E extends keyof Handler>(message: EventMessage<E>) {
        const eventHandler = handler(this.state, this.emit)[message.type] as EventHandler<E>

        if (eventHandler) {
            eventHandler(message.event)
        }
    }

    onEffect(newHandler: EmitEffect) {
        this.handlers.push(newHandler)
    }
}
