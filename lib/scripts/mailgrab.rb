require 'net/imap'
require 'mail'

def parse_email_body(msg)
  # Implement your parsing logic here
  # Example: Extracting the plain text body
  if msg.multipart?
    msg.text_part.body.decoded
  else
    msg.body.decoded
  end
end

def process_emails(username, password, server)
  # Connect to the IMAP server
  imap = Net::IMAP.new(server, ssl: true)
  imap.login(username, password)
  imap.select('inbox')

  # Search for unread emails
  messages = imap.search(['UNSEEN'])
  messages.each do |message_id|
    msg = Mail.new(imap.fetch(message_id, 'RFC822')[0].attr['RFC822'])

    body = parse_email_body(msg)

    # Implement your filtering logic here
    if subject.include?('Chick-fil-a')
      # Perform actions based on your filtering criteria
      puts "Filtered Email Body: #{body}"
    end
  end

  # Logout and close the connection
  imap.logout
  imap.disconnect
end

# Replace these with your email credentials and server details
email_username = 'z96021958@gmail.com'
email_password = 'bjfg dyce jzly tfwv'
email_server = 'imap.gmail.com'

process_emails(email_username, email_password, email_server)
