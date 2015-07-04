# hubot-google-lucky

A hubot script that returns I'm feeling lucky's Google result

See [`src/google-lucky.coffee`](src/google-lucky.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-google-lucky --save`

Then add **hubot-google-lucky** to your `external-scripts.json`:

```json
[
  "hubot-google-lucky"
]
```

## Sample Interaction

```
User1> hubot feeling lucky for hacker news
Hubot> User1: https://news.ycombinator.com/

User1> hubot lucky xkcd
Hubot> User1: http://xkcd.com/

User1> hubot luck hubot
Hubot> User1: https://hubot.github.com/
```
