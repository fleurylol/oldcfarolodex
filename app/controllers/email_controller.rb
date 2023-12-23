require 'net/imap'
require 'mail'
require 'nokogiri'

class EmailController < ApplicationController
  def retrieve_emails
    imap = Net::IMAP.new('imap.gmail.com', port: 993, ssl: true)
    imap.authenticate('PLAIN', 'z96021958@gmail.com', 'ekhi zulb twdl utfq')
    imap.select('INBOX') # Use the mailbox you want to retrieve emails from

    # Search for all emails
    ids = imap.search(['ALL'])

    @emails = []

    ids.each do |id|
  msg_data = imap.fetch(id, 'RFC822')[0]
  msg = msg_data.attr['RFC822']

  # Parse the email using the Mail gem
  mail = Mail.new(msg)

  # Store the entire raw email data
  raw_email_data = { raw_data: msg, table_data: nil }

  # Add Nokogiri code to extract the table information from the HTML body
  if mail.html_part
    html_body = mail.html_part.body.decoded
    doc = Nokogiri::HTML(html_body)

    # Find the table in the HTML
    table = doc.at('table')

    # Extract information from the table
    if table
      # Process rows of the table
      table_data = table.css('tr').map do |row|
        # Process cells in each row
        row.css('td').map(&:text.strip)
      end

      raw_email_data[:table_data] = table_data
    else
      puts 'Table not found in the HTML'
      puts 'HTML Body:'
      puts html_body
    end
  else
    puts 'No HTML part found in the email'

  end

  # Store the raw email data in your data structure
  @emails << raw_email_data
	end
    imap.logout
    imap.disconnect

    render 'catering/packing'
  end
end
