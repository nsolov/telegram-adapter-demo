# Telegram Adapter Demo

This demo shows how to use the Telegram Adapter.

Telegram Adapter package: https://openexchange.intersystems.com/package/telegram-adapter

With this app, the bot responds to any message in chats.

## How to install this Demo:

1. Create a Telegram bot and obtain a token (see instructions below)
2. Make sure you have IPM installed in your InterSystems IRIS.
Open Terminal. Select IRIS Namespace with Interoperability Enabled.
Call:
```
USER>zpm "install telegram-adapter-demo -D TgToken=your_telegram_token"
```

## How to run the Demo:

1. Open the production `Telegram.Demo.EchoProduction`
2. Check the required parameters to connect to telegram API in the `Telegram.BusinessOperation` business operation and in the `Telegram.LongPollingService` business service (Connection Settings block)
   * Server (usually `api.telegram.org`)
   * Token
   * SSL Configuration
3. Create a chat on telegram
4. Add the created bot as a user to the chat and grant it administrator rights.
5. Launch the production
6. Add another user to the chat - you will see a greeting from IRIS.
7. Write something in the chat - you will see the echo from IRIS.

## How to get a telegram token

Use telegram bot @BotFather. Use the `/newbot` command to create a new bot - you will receive a token (token example 110201543:AAHdqTcvCH1vGWJxfSeofSAs0K5PALDsaw). Read more here https://core.telegram.org/bots/features#botfather.

