# Langtastic

Reads data language subtag data from the iana.org language subtag registry and 
parses it into a somewhat usable form.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'langtastic'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install langtastic

## Usage

```ruby
require 'langtastic'
Langtastic.subtags
=> [{"File-Date"=>"2015-05-12"},
{"Type"=>"language", "Subtag"=>"aa", "Description"=>"Afar", "Added"=>"2005-10-16"},
{"Type"=>"language", "Subtag"=>"ab", "Description"=>"Abkhazian", "Added"=>"2005-10-16", "Suppress-Script"=>"Cyrl"},
{"Type"=>"language", "Subtag"=>"ae", "Description"=>"Avestan", "Added"=>"2005-10-16"},
{"Type"=>"language", "Subtag"=>"af", "Description"=>"Afrikaans", "Added"=>"2005-10-16", "Suppress-Script"=>"Latn"},
{"Type"=>"language", "Subtag"=>"ak", "Description"=>"Akan", "Added"=>"2005-10-16", "Scope"=>"macrolanguage"},
{"Type"=>"language", "Subtag"=>"am", "Description"=>"Amharic", "Added"=>"2005-10-16", "Suppress-Script"=>"Ethi"},
{"Type"=>"language", "Subtag"=>"an", "Description"=>"Aragonese", "Added"=>"2005-10-16"},
...,
{"Type"=>"region", "Subtag"=>"AA", "Description"=>"Private use", "Added"=>"2005-10-16"},
{"Type"=>"region", "Subtag"=>"AC", "Description"=>"Ascension Island", "Added"=>"2009-07-29"},
{"Type"=>"region", "Subtag"=>"AD", "Description"=>"Andorra", "Added"=>"2005-10-16"},
{"Type"=>"region", "Subtag"=>"AE", "Description"=>"United Arab Emirates", "Added"=>"2005-10-16"},
{"Type"=>"region", "Subtag"=>"AF", "Description"=>"Afghanistan", "Added"=>"2005-10-16"},
{"Type"=>"region", "Subtag"=>"AG", "Description"=>"Antigua and Barbuda", "Added"=>"2005-10-16"},
{"Type"=>"region", "Subtag"=>"AI", "Description"=>"Anguilla", "Added"=>"2005-10-16"},
{"Type"=>"region", "Subtag"=>"AL", "Description"=>"Albania", "Added"=>"2005-10-16"},
{"Type"=>"region", "Subtag"=>"AM", "Description"=>"Armenia", "Added"=>"2005-10-16"},
...
]
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/langtastic/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
