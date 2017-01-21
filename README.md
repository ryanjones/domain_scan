# Domain Scan

A quick rails app to visit a csv of urls and grab a snapshot of the page.

* clone the repo
* run ```bundle install```  
* run ```bin/rake db:migrate```
* Update csv file in lib/data/test_data.csv - Domains must have http:// or https://
* run ```bin/rails s```
* visit localhost:3000 

The homepage *will* take a while to load depending on how many urls you're loading. Not a production app, meant to be ran locally, no tests.
