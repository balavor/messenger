# Queue management system for Dubai Taxi project

## Technology stack

- React.JS as UI render engine
- Electron as desktop app environment
- Typescript as dialect of Javascript for React and Node
- Node.js as server engine
- MySQL as persistent storage 
- WebSockets as transport between server and nodes

## Components

### Server

Node.js instance that coordinate and control other nodes.

### Kiosk

Electron app that represent kiosk interface. 
It is capable of displaying list of cars from server and send requests for tickets

### Ticket printer operator simulator

Electron app that simulates ticket printer operator. 
It is capable of receiving requests for tickets and have UI to send events back to server

### Ticket scanner operator simulator

Electron app that simulates ticket scanner operator.
It is capable to enter ticket info and have UI to send back scan result to server