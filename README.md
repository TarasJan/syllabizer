# Syllabizer

Syllabizer is a simple gem for estimating number of syllables of an English words. Its tested efficiency is about 75% percent.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add syllabizer

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install syllabizer

## Usage

```
irb(main):004:0> Syllabizer.count_syllables('beer')
=> 1
irb(main):005:0> Syllabizer.count_syllables('candle')
=> 2
irb(main):006:0> Syllabizer.count_syllables('carjacking')
=> 3
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/TarasJan/syllabizer.
