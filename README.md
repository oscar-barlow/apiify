# apiify

apiify is a little gem that takes any .csv file and turns it into an API.

It's aimed at large organisations, e.g. government departments, that publish a lot of data as .csv and who want a quick way to access this data as JSON in their digital services.

## Requirements
You will need to initialize a [Rails API-only application](http://edgeguides.rubyonrails.org/api_app.html) with a Postgres database, by running something like the following:

    $ rails new <my-api> -d=postgresql --api

Then make your database with `$ bin/rake db:create`.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'apiify'
```

And install with `bundle`. Or install it yourself as:

    $ gem install apiify

## Usage

Locate the CSV file you want to turn into an API. The name of the CSV file will become the name of the database table you will create, so ensure it is named appropriately.

**Bad:**
* 2017-list_of_bunnies-FINALv2.csv

**Good:**
* bunny.csv

In your Rails API project directory, run `$ apiify new <path-to-csv>`. This will run an API-appropriate scaffold via rails (i.e. a model, controller, and serializer will be created; so will a migration).

The model's properties will be derived from the CSV column headers, so ensure they are properly named. apiify auto-detects an appropriate property type based on the contents of each column.

**Bad:**
* sub_cat3

**Good:**
* breed_category

apiify will prompt you to run `$ bin/rake db:migrate`. Do so.

Then run `$ apiify import <path-to-csv>`. This will import each row in your CSV file as a new record in your database.

Run `$ bin/rails s` to boot up your rails server. Visit `localhost:3000/<pluralised model name>` to see your data in lovely, lovely JSON format.

Run `apiify help` to see a list of commands and get help with their usage.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/oscar-barlow/apiify.

## Authors
* [Chris Cooper](https://github.com/cjcoops)
* [Jenna Ramdenee](https://github.com/jennaramdenee)
* [Keomony Khun](https://github.com/keomony)
* [Oscar Barlow](https://github.com/oscar-barlow/)


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
