# ROCKET ELEVATORS INFORMATION SYSTEM

Ruby On Rails project for RocketElevators.  
Make the interactive website with the original static website of "Jackie" and link it to a database to store "User" and "Employee" login data and the quote data in separate tables.  
The website have a backoffice that employee can login to access the data from quote.

###### New Update Week 8 | Odyssey :   April 3rd 2020 ######
An API allowing GraphQL queries
    
## Back Office Admin Logins
  - admin@example.com , password
  - test@test , 123123

- Mathieu Houde | coach | mathieu.houde@codeboxx.biz | password: 123456
- Patrick Thibault | coach | tiboclan@gmail.com | password: 123456
- Philippe Motillon | coach | philippe.motillon@keyrus.ca | password: 123456
- Khalid Kjado | coach | kdjado@gmail.com | password: 123456
- Antoine Deblonde | coach | antoine.deblonde@keyrus.ca | password: 123456
- Ibrahim Mahamane | coach | imahamaneissa@gmail.com | password: 123456

## How to use
- Retrieving the address of the building, the beginning and the end of the intervention for a specific intervention.
In order to make this query work, you need to enter the following in the server.

**
 query{
   intervention(id:2){
     dateStartIntervention
     dateEndIntervention
     employeeId
     building{
       techFullName
       address{
         status
         numberNStreet
         postalCode
       }
     }
   }
 }
 **

## Configuration
  - Ruby version : 2.6.5  
  - Rails version : 5.2.4.1
  - Gem version : 3.1.2
  - Bundler version : 1.17.3

## Link to the video


## Collaborators
  - Maria - Team Leader -maguilar93

  - Reda - Collaborator - RdaBouazzaoui

  - Kiril - Collaborator - kirilkk9

  - Alexis - Collaborator - Ticass


## List of required Gems
      actioncable (5.2.4.1)
      actionpack (= 5.2.4.1)
      nio4r (~> 2.0)
      websocket-driver (>= 0.6.1)
    actionmailer (5.2.4.1)
      actionpack (= 5.2.4.1)
      actionview (= 5.2.4.1)
      activejob (= 5.2.4.1)
      mail (~> 2.5, >= 2.5.4)
      rails-dom-testing (~> 2.0)
    actionpack (5.2.4.1)
      actionview (= 5.2.4.1)
      activesupport (= 5.2.4.1)
      rack (~> 2.0, >= 2.0.8)
      rack-test (>= 0.6.3)
      rails-dom-testing (~> 2.0)
      rails-html-sanitizer (~> 1.0, >= 1.0.2)
    actionview (5.2.4.1)
      activesupport (= 5.2.4.1)
      builder (~> 3.1)
      erubi (~> 1.4)
      rails-dom-testing (~> 2.0)
      rails-html-sanitizer (~> 1.0, >= 1.0.3)
    activeadmin (2.6.1)
      arbre (~> 1.2, >= 1.2.1)
      formtastic (~> 3.1)
      formtastic_i18n (~> 0.4)
      inherited_resources (~> 1.7)
      jquery-rails (~> 4.2)
      kaminari (~> 1.0, >= 1.0.1)
      railties (>= 5.2, < 6.1)
      ransack (~> 2.1, >= 2.1.1)
      sassc-rails (~> 2.1)
      sprockets (>= 3.0, < 4.1)
    activejob (5.2.4.1)
      activesupport (= 5.2.4.1)
      globalid (>= 0.3.6)
    activemodel (5.2.4.1)
      activesupport (= 5.2.4.1)
    activerecord (5.2.4.1)
      activemodel (= 5.2.4.1)
      activesupport (= 5.2.4.1)
      arel (>= 9.0)
    activestorage (5.2.4.1)
      actionpack (= 5.2.4.1)
      activerecord (= 5.2.4.1)
      marcel (~> 0.3.1)
    activesupport (5.2.4.1)
      concurrent-ruby (~> 1.0, >= 1.0.2)
      i18n (>= 0.7, < 2)
      minitest (~> 5.1)
      tzinfo (~> 1.1)
    addressable (2.7.0)
      public_suffix (>= 2.0.2, < 5.0)
    airbrussh (1.4.0)
      sshkit (>= 1.6.1, != 1.7.0)
    arbre (1.2.1)
      activesupport (>= 3.0.0)
    archive-zip (0.12.0)
      io-like (~> 0.3.0)
    arel (9.0.0)
    autoprefixer-rails (9.7.4)
      execjs
    bcrypt (3.1.13)
    bindex (0.8.1)
    bootsnap (1.4.6)
      msgpack (~> 1.0)
    bootstrap (4.4.1)
      autoprefixer-rails (>= 9.1.0)
      popper_js (>= 1.14.3, < 2)
      sassc-rails (>= 2.0.0)
    builder (3.2.4)
    byebug (11.1.1)
    capistrano (3.12.0)
      airbrussh (>= 1.0.0)
      i18n
      rake (>= 10.0.0)
      sshkit (>= 1.9.0)
    capistrano-bundler (1.6.0)
      capistrano (~> 3.1)
    capistrano-rails (1.4.0)
      capistrano (~> 3.1)
      capistrano-bundler (~> 1.1)
    capistrano-rake (0.2.0)
      capistrano (>= 3.0)
    capistrano3-puma (3.1.1)
      capistrano (~> 3.7)
      capistrano-bundler
      puma (~> 3.4)
    capybara (3.31.0)
      addressable
      mini_mime (>= 0.1.3)
      nokogiri (~> 1.8)
      rack (>= 1.6.0)
      rack-test (>= 0.6.3)
      regexp_parser (~> 1.5)
      xpath (~> 3.2)
    chartkick (3.3.1)
    childprocess (3.0.0)
    chromedriver-helper (2.1.1)
      archive-zip (~> 0.10)
      nokogiri (~> 1.8)
    chronic (0.10.2)
    coffee-rails (4.2.2)
      coffee-script (>= 2.2.0)
      railties (>= 4.0.0)
    coffee-script (2.4.1)
      coffee-script-source
      execjs
    coffee-script-source (1.12.2)
    concurrent-ruby (1.1.6)
    crass (1.0.6)
    date (3.0.0)
    devise (4.7.1)
      bcrypt (~> 3.0)
      orm_adapter (~> 0.1)
      railties (>= 4.1.0)
      responders
      warden (~> 1.2.3)
    erubi (1.9.0)
    execjs (2.7.0)
    faker (2.10.2)
      i18n (>= 1.6, < 2)
    ffi (1.12.2)
    font-awesome-rails (4.7.0.5)
      railties (>= 3.2, < 6.1)
    font-awesome-sass (5.12.0)
      sassc (>= 1.11)
    formtastic (3.1.5)
      actionpack (>= 3.2.13)
    formtastic_i18n (0.6.0)
    globalid (0.4.2)
      activesupport (>= 4.2.0)
    graphiql-rails (1.7.0)
      railties
      sprockets-rails
    graphql (1.10.5)
    has_scope (0.7.2)
      actionpack (>= 4.1)
      activesupport (>= 4.1)
    i18n (1.8.2)
      concurrent-ruby (~> 1.0)
    inherited_resources (1.11.0)
      actionpack (>= 5.0, < 6.1)
      has_scope (~> 0.6)
      railties (>= 5.0, < 6.1)
      responders (>= 2, < 4)
    io-like (0.3.1)
    jbuilder (2.10.0)
      activesupport (>= 5.0.0)
    jquery-rails (4.3.5)
      rails-dom-testing (>= 1, < 3)
      railties (>= 4.2.0)
      thor (>= 0.14, < 2.0)
    kaminari (1.2.0)
      activesupport (>= 4.1.0)
      kaminari-actionview (= 1.2.0)
      kaminari-activerecord (= 1.2.0)
      kaminari-core (= 1.2.0)
    kaminari-actionview (1.2.0)
      actionview
      kaminari-core (= 1.2.0)
    kaminari-activerecord (1.2.0)
      activerecord
      kaminari-core (= 1.2.0)
    kaminari-core (1.2.0)
    listen (3.1.5)
      rb-fsevent (~> 0.9, >= 0.9.4)
      rb-inotify (~> 0.9, >= 0.9.7)
      ruby_dep (~> 1.2)
    loofah (2.4.0)
      crass (~> 1.0.2)
      nokogiri (>= 1.5.9)
    mail (2.7.1)
      mini_mime (>= 0.1.1)
    marcel (0.3.3)
      mimemagic (~> 0.3.2)
    method_source (0.9.2)
    mimemagic (0.3.4)
    mini_mime (1.0.2)
    mini_portile2 (2.4.0)
    minitest (5.14.0)
    mixitup-rails (3.3.1)
      railties (>= 3.1)
    msgpack (1.3.3)
    mysql2 (0.5.3)
    net-scp (2.0.0)
      net-ssh (>= 2.6.5, < 6.0.0)
    net-ssh (5.2.0)
    nio4r (2.5.2)
    nokogiri (1.10.9)
      mini_portile2 (~> 2.4.0)
    orm_adapter (0.5.0)
    owlcarousel-rails (1.1.3.3)
      jquery-rails
    pg (1.2.2)
    polyamorous (2.3.2)
      activerecord (>= 5.2.1)
    popper_js (1.16.0)
    public_suffix (4.0.3)
    puma (3.12.4)
    rack (2.2.2)
    rack-test (1.1.0)
      rack (>= 1.0, < 3)
    rails (5.2.4.1)
      actioncable (= 5.2.4.1)
      actionmailer (= 5.2.4.1)
      actionpack (= 5.2.4.1)
      actionview (= 5.2.4.1)
      activejob (= 5.2.4.1)
      activemodel (= 5.2.4.1)
      activerecord (= 5.2.4.1)
      activestorage (= 5.2.4.1)
      activesupport (= 5.2.4.1)
      bundler (>= 1.3.0)
      railties (= 5.2.4.1)
      sprockets-rails (>= 2.0.0)
    rails-assets-datatables (1.10.19)
      rails-assets-jquery (>= 1.7.0)
    rails-assets-jquery (3.4.1)
    rails-dom-testing (2.0.3)
      activesupport (>= 4.2.0)
      nokogiri (>= 1.6)
    rails-html-sanitizer (1.3.0)
      loofah (~> 2.3)
    railties (5.2.4.1)
      actionpack (= 5.2.4.1)
      activesupport (= 5.2.4.1)
      method_source
      rake (>= 0.8.7)
      thor (>= 0.19.0, < 2.0)
    rake (13.0.1)
    ransack (2.3.2)
      activerecord (>= 5.2.1)
      activesupport (>= 5.2.1)
      i18n
      polyamorous (= 2.3.2)
    rb-fsevent (0.10.3)
    rb-inotify (0.10.1)
      ffi (~> 1.0)
    regexp_parser (1.7.0)
    responders (3.0.0)
      actionpack (>= 5.0)
      railties (>= 5.0)
    ruby_dep (1.5.0)
    rubyzip (2.2.0)
    rvm1-capistrano3 (1.4.0)
      capistrano (~> 3.0)
      sshkit (>= 1.2)
    sass (3.7.4)
      sass-listen (~> 4.0.0)
    sass-listen (4.0.0)
      rb-fsevent (~> 0.9, >= 0.9.4)
      rb-inotify (~> 0.9, >= 0.9.7)
    sass-rails (5.1.0)
      railties (>= 5.2.0)
      sass (~> 3.1)
      sprockets (>= 2.8, < 4.0)
      sprockets-rails (>= 2.0, < 4.0)
      tilt (>= 1.1, < 3)
    sassc (2.2.1)
      ffi (~> 1.9)
    sassc-rails (2.1.2)
      railties (>= 4.0.0)
      sassc (>= 2.0)
      sprockets (> 3.0)
      sprockets-rails
      tilt
    selenium-webdriver (3.142.7)
      childprocess (>= 0.5, < 4.0)
      rubyzip (>= 1.2.2)
    spring (2.1.0)
    spring-watcher-listen (2.0.1)
      listen (>= 2.7, < 4.0)
      spring (>= 1.2, < 3.0)
    sprockets (3.7.2)
      concurrent-ruby (~> 1.0)
      rack (> 1, < 3)
    sprockets-rails (3.2.1)
      actionpack (>= 4.0)
      activesupport (>= 4.0)
      sprockets (>= 3.0.0)
    sshkit (1.21.0)
      net-scp (>= 1.1.2)
      net-ssh (>= 2.8.0)
    thor (1.0.1)
    thread_safe (0.3.6)
    tilt (2.0.10)
    turbolinks (5.2.1)
      turbolinks-source (~> 5.2)
    turbolinks-source (5.2.0)
    tzinfo (1.2.6)
      thread_safe (~> 0.1)
    uglifier (4.2.0)
      execjs (>= 0.3.0, < 3)
    warden (1.2.8)
      rack (>= 2.0.6)
    web-console (3.7.0)
      actionview (>= 5.0)
      activemodel (>= 5.0)
      bindex (>= 0.4.0)
      railties (>= 5.0)
    websocket-driver (0.7.1)
      websocket-extensions (>= 0.1.0)
    websocket-extensions (0.1.4)
    whenever (1.0.0)
      chronic (>= 0.6.3)
    xpath (3.2.0)
      nokogiri (~> 1.8)

PLATFORMS
  ruby

DEPENDENCIES
  activeadmin
  bootsnap (>= 1.1.0)
  bootstrap (~> 4.4.1)
  byebug
  capistrano (~> 3.10)
  capistrano-bundler (>= 1.1.0)
  capistrano-rails (~> 1.4)
  capistrano-rake
  capistrano3-puma
  capybara (>= 2.15)
  chartkick
  chromedriver-helper
  coffee-rails (~> 4.2)
  date
  devise
  faker
  font-awesome-rails
  font-awesome-sass (~> 5.12.0)
  graphiql-rails
  graphql
  jbuilder (~> 2.5)
  jquery-rails
  listen (>= 3.0.5, < 3.2)
  mixitup-rails
  mysql2 (>= 0.4.4, < 0.6.0)
  owlcarousel-rails (~> 1.1, >= 1.1.3.3)
  pg (>= 0.18, < 2.0)
  puma (~> 3.11)
  rails (~> 5.2.4, >= 5.2.4.1)
  rails-assets-datatables!
  rails-assets-jquery!
  rvm1-capistrano3
  sass-rails (~> 5.0)
  selenium-webdriver
  spring
  spring-watcher-listen (~> 2.0.0)
  turbolinks (~> 5)
  tzinfo-data
  uglifier (>= 1.3.0)
  web-console (>= 3.3.0)
  whenever

  
