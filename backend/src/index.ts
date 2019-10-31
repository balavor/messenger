import express from 'express'
import http from 'http'
import socketIO from 'socket.io'
import { Dispatcher } from './dispatcher'
import { EventMessage } from './events'
import { Handler } from './handler'

const app = express()
const server = http.createServer(app)
const io = socketIO(server)

server.listen(3000, function() {
    // eslint-disable-next-line no-console
    console.log('listening on *:3000')
})

app.get('/health', function(_req, res) {
    console.log('alive')
    res.send('Server is alive')
})

const dispatcher = new Dispatcher()

io.on('connection', function(socket) {
    console.log(`client connected`)

    socket.on('event', event => {
        console.log(`event: ${JSON.stringify(event)}`)
        const eventMessage = event as EventMessage<keyof Handler>
        dispatcher.dispatch(eventMessage)
    })

    dispatcher.onEffect((type, effect) => {
        socket.emit('effect', { type, effect })
    })
})
