# ruby-feroxbuster

[![CI](https://github.com/postmodern/ruby-feroxbuster/actions/workflows/ruby.yml/badge.svg)](https://github.com/postmodern/ruby-gobuster/actions/workflows/ruby.yml)
[![Gem Version](https://badge.fury.io/rb/ruby-feroxbuster.svg)](https://badge.fury.io/rb/ruby-gobuster)

* [Source](https://github.com/postmodern/ruby-feroxbuster/)
* [Issues](https://github.com/postmodern/ruby-feroxbuster/issues)
* [Documentation](http://rubydoc.info/gems/ruby-feroxbuster/frames)

## Description

A Ruby interface to [feroxbuster], a simple, fast, recursive content discovery
tool written in Rust.

## Features

* Provides a [Ruby interface][Feroxbuster::Command] for running the
  `feroxbuster` command.
* Supports [parsing][Feroxbuster::OtuputFile] feroxbuster `.txt` and `.json`
  output files.

[Feroxbuster::Command]: https://rubydoc.info/gems/ruby-feroxbuster/Feroxbuster/Command
[Feroxbuster::OutputFile]: https://rubydoc.info/gems/ruby-amass/Feroxbuster/OutputFile

## Examples

Run `feroxbuster --wordlist /path/to/wordlist.txt --url https://example.com` from Ruby:

```ruby
require 'feroxbuster/command'

Feroxbuster::Command.run(wordlist: '/path/to/wordlist.txt', url: 'https://example.com')
```

## Requirements

* [ruby] >= 2.0.0
* [feroxbuster] >= 2.7.0
* [command_mapper] ~> 0.2

[ruby]: https://www.ruby-lang.org/
[command_mapper]: https://github.com/postmodern/command_mapper.rb#readme

## Install

```shell
$ gem install ruby-feroxbuster
```

### gemspec

```ruby
gemspec.add_dependency 'ruby-feroxbuster', '~> 0.1'
```

### Gemfile

```ruby
gem 'ruby-feroxbuster', '~> 0.1'
```

## License

Copyright (c) 2022 Hal Brodigan

See {file:LICENSE.txt} for license information.

[feroxbuster]: https://github.com/epi052/feroxbuster#readme
