**Notice:** This project is no longer being maintained. As of January 2018, two vulnerabilities have been discovered in gems that this project depends on: Nokogiri and Paperclip. If you plan to use this project in any way, consider updating these dependencies.

# CRSL: a carousel management app

Carousel is an app designed to turn any conventional "smart" TV into a public
address display. Professional alternatives for showing rotating information such
as Samsung's MagicInfo, are too expensive and often exceed the needs of small
businesses or schools. With CRSL, you can use any web browser to upload posters of
upcoming events. CRSL will provide you with a URL at which to point your TV's
web browsers.

## Features

* Create as many carousels as you need for all your TVs or use the same carousel
    for all your screens. Or both!
* Customize carousel speed.
* Compensate for screen orientation: no matter how you choose to place your
    screen, Carousel will rotate posters so that they never read upside down.
* **Save money on professional public address displays.** These pieces of equipment
    are often twice as expensive of a normal TV and do not offer many
    advantages. With CRSL you can reuse a TV you no longer need.
* **Not limited to TVs!** With CRSL, you can use any device with a web browser
    as a screen to showcase your posters. Just point it to the URL provided by
    CRSL and, voilà, you just turned that old iPad into an advertising screen.
* Uninterrupted creativity: carousel will not overlay any text or symbols on top
    of your poster. Use your favorite editor to customize every aspect of how it
    will look and then export it as a high resolution image. Carousel will take
    care of the rest.

## Installation

Carousel is a Ruby on Rails 5 application designed to run on Puma and MySQL.
Setup is the normal procedure for any Rails app, but here are some guidelines:

* Create a MySQL user with permissions to CRUD and create/drop databases.
* Configure Devise's (auth) email. You will need a SMTP username and password
  (you can use Sendgrid). Also, you must configure CRSL's default from
  address.
* Setup a webserver to serve static files and forward other requests to CRSL.
* You can use the `./upstart.sh` script to start the application.
