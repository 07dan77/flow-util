# Flow Util
Interact with your Octoblu Flow

[![Build Status](https://travis-ci.org/octoblu/flow-util.svg?branch=master)](https://travis-ci.org/octoblu/flow-util)


## Install
```
npm install -g flow-util
```

## Usage

```
cat meshblu.json
{
  "uuid": "aa28070e-576a-4a16-bf96-ab920520c424",
  "token": "c8083253780c46ad9faec2687fdb47fe"
}
```

## Pause

Halt message passing inside the flow

```
flow-util pause ./meshblu.json
```

## Resume

Resume message passing inside the flow

```
flow-util resume ./meshblu.json
```

## Save

Save the current state of the flow
```
flow-util save ./meshblu.json
```

## Pause and Save

Halt message passing inside the flow and save current state
```
flow-util savepause ./meshblu.json
```
