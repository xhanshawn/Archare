# Archare

Archare gem

Currently archare provides a crawler to collect data from a algorithm online judge website [Leetcode](https://leetcode.com/).
Leetcode is a very good website for programmer to learn, practice and challenge some algorithm problems.

As a user of Leeet code, I believe that we could take advantage of the data on Leetcode to analyze and generalize some good ways to understand algorithm problems.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'archare'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install archare

## Usage

  Archare crawler

      Usage:
        crawler = Archare.crawler

        leetcode tags:
          crawler.lc_tags

        leetcode problems:
          crawler.lc_problems

        leetcode tags-problems map:
          crawler.lc_tags_problems_map

      Update data from leetcode:
        crawler.update_lc_data         (updating time is about 20s)



## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/archare. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

