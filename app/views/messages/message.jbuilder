json.id               @message['id']
json.recipients       @message['recipients'].join(', ')
json.subject          @message['subject']
json.body             @message['body']
