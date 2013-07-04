Intro
-------

BuurtSMS is a Ruby on Rails app to receive SMS, configured for Nexmo SMS Gateway (www.nexmo.com)

It was built during Code for Europe Amsterdam (2013) for testing interaction between citizens and team of professional by allowing to interact through a single channel (the MSISDN number) instead than using many devices from each worker. 

By having a single point of contact, people can send SMS to that number, that can be printed on flyers or business cards.

Technical Details
-------

BuurtSMS is a Ruby on Rails application.
It was designed to run hosted on Heroku, and has been developed on Ruby 1.9.3 + Rails 3.
User registration is disabled by choice and the users are created via console.
Registration was disabled by changing the `routes.rb` file. 
The Heroku instance where it was deployed has Sendgrid configured to send email (for password recovery). Please check the `production.rb` file in the configuration folder and the `sendgrid.rb` initializer files. 
The default language has been set to 'nl' as it was deployed in Amsterdam.



