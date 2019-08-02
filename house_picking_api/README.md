# README

House APi. Fetch house data from the site `https://www.morissimmobilier.com/recherche-immobiliere-avancee/?advanced_city=&surface-min=0&nb-chambres-min=0&budget-max=5000000`
and display the API.

## Setup
A migration is needed first.
```
rake db:migrate
```
Fill house data by typing.
```
curl -XPOST -H 'Content-Type: application/json' http://localhost:3001/api/v1/houses
```

## Test
```
bundle exec rspec spec/*
```

## API
```
rails s
```

#### Resources
- [Rspec](https://github.com/rspec/rspec-rails)
