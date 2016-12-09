# PlusOne

This repo contains a generic releases script for bumping a git tag and pushing it to the 'origin'

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'plus-one'
```

And then execute:

```bash
$ bundle
```

## Usage

### help

```bash
$ bundle exec plus-one
Commands:
  plus-one create          # create next release
  plus-one current         # show current release
  plus-one help [COMMAND]  # Describe available commands or one specific command
```

### create a release

```bash
$ bundle exec plus-one create
Fetching from origin
You are about to create release 'v1.0.1'.

This means:
* a tag 'v1.0.1' will be created
* this tag will be pushed to origin
Continue? y
# will create tag and push
```

## Contributing

1. [Fork the repository](https://github.com/ralfclaassens/plus-one)

1. Clone your newly created repository (e.g. `git clone git@github.com:ralfclaassens/plus-one.git`)

1. Create a feature branch (`git checkout -b my-additions`) and make the changes

1. Commit your changes (`git commit -am 'My additions'`)

1. Push the branch (`git push origin -u my-new-feature`)

1. Visit the Project-page of your fork and select 'New Merge Request' (select `my-additions` as source-branch)

