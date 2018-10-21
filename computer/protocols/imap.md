# IMAP Protocol

* [IMAP 4 Standard][imap4]

[imap4]: https://tools.ietf.org/html/rfc3501

# Verbs

## [APPEND][append-command]

### parameters

* mailbox name: the folder to append the message to,
* 'flag parenthesized list' (optional): a [list][parenthesized-list] of [flags][message-flags] to set
  on the message,
* date/time string (optional)
* message literal: the message in RFC-2822 format.

### responses

* success: tag `OK APPEND completed`

## [RENAME][rename-command]

### parameters

* existing mailbox name
* new mailbox name

### responses

* success: tag `OK RENAME completed`

## [SELECT][select-command]

### parameters

* mailbox name: the folder to append the message to.

[append-command]: https://tools.ietf.org/html/rfc3501#section-6.3.11
[rename-command]: https://tools.ietf.org/html/rfc3501#section-6.3.5
[select-command]: https://tools.ietf.org/html/rfc3501#section-6.3.1

# Extensions

## [UIDPLUS][uidplus]

When a server implements UIDPLUS, it eturns newly generated uids for
APPEND and COPY commands and adds the 'UID EXPUNGE' command.

* APPEND

TAG` OK [APPENDUID `UID` `UID_VALIDITY`] APPEND completed`

[uidplus]: https://tools.ietf.org/html/rfc4315

# Glossary

* [Client Protocol Sender and Server Protocol Receiver][client-sender-server-receiver]: client calling protocol,
* [Flags Message Attribute][message-flags]: \Seen|\Answered|\Flagged|\Deleted|\Draft|\Recent,
* [Parenthesized list][parenthesized-list]: a list of space separated terms, surrounded by parentheses,
* tag: a client-generated prefix for each command (see 'Client Protocol Sender and Server Protocol Receiver').

[message-flags]: https://tools.ietf.org/html/rfc3501#section-2.3.2
[parenthesized-list]: https://tools.ietf.org/html/rfc3501#section-4.4
[client-sender-server-receiver]: https://tools.ietf.org/html/rfc3501#section-2.2.1 "Client Protocol Sender and Server Protocol Receiver"
