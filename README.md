# Release

This repo contains a generic releases script for bumping a git tag and pushing it to the 'origin'

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'release', git: 'release'
```

And then execute:

```bash
$ bundle
```

## Usage

### help

```bash
$ bundle exec release
Commands:
  release create          # create next release
  release current         # show current release
  release help [COMMAND]  # Describe available commands or one specific command
```

### create a release

```bash
$ bundle exec release create
Fetching from origin
You are about to create release 'v1.0.1'.

This means:
* a tag 'v1.0.1' will be created
* this tag will be pushed to origin
Continue? y
# will create tag and push
```

## Contributing

1. [Fork the repository](https://github.com/ralfclaassens/release)

1. Clone your newly created repository (e.g. `git clone git@github.com:ralfclaassens/release.git`)

1. Create a feature branch (`git checkout -b my-additions`) and make the changes

1. Commit your changes (`git commit -am 'My additions'`)

1. Push the branch (`git push origin -u my-new-feature`)

1. Visit the Project-page of your fork and select 'New Merge Request' (select `my-additions` as source-branch)

