# frozen_string_literal: true
require 'rubygems'
require 'bundler/setup'
require 'thor'
require 'cocaine'

module PlusOne
  class OurVersion < Gem::Version
    def succ
      major, minor, patch = segments
      self.class.new([major, minor, patch.next].join('.'))
    end

    def self.from_tag(tag)
      new(tag[/(\d+\.\d+\.\d+)/, 1])
    end

    def to_s
      "v#{super}"
    end
  end

  class Cli < Thor
    desc 'create', 'create next plus-one'
    def create
      git_fetch!
      say <<-EOS
  You are about to create plus-one '#{next_release}'.

  This means:
  * a tag '#{next_release}' will be created
  * this tag will be pushed to origin
      EOS
      create_release!(next_release) if yes?('Continue?')
    end

    desc 'current', 'show current plus-one'
    def current
      git_fetch!
      say("#{current_release} (#{release_date(current_release)})")
    end

    no_commands do
      def git(rest, **opts)
        Cocaine::CommandLine.new('git', rest, opts)
      end

      def git_fetch!
        say('Fetching from origin')
        git('fetch origin --tags', swallow_stderr: true).run
      end

      def create_release!(release)
        git_tag = git(%(tag -a #{release} -m "Version #{release}"))
        git_push_tags = git(%(push origin --tags))
        git_push = git(%(push origin))

        git_tag.run
        git_push.run
        git_push_tags.run
      end

      def current_release
        OurVersion.from_tag(git('tag | sort').run.chomp.split("\n").last)
      end

      def release_date(release)
        git("log -n 1 #{release} --format='%ci'").run.chomp
      end

      def next_release
        current_release.succ
      end
    end
  end
end
