# frozen_string_literal: true
require 'spec_helper'

describe PlusOne::Cli do
  let(:command_line) { instance_double Cocaine::CommandLine }

  before :each do
    allow(Cocaine::CommandLine).to receive(:new).and_return(command_line)
    allow(command_line).to receive(:run).and_return("1.0.0\1.0.1")
    allow_any_instance_of(Thor::Shell::Basic).to receive(:yes?).and_return(true)
  end

  let(:stdout_create) do
    "Fetching from origin
  You are about to create plus-one 'v1.0.1'.

  This means:
  * a tag 'v1.0.1' will be created
  * this tag will be pushed to origin\n"
  end

  describe '#create' do
    it 'prints to the console' do
      expect { subject.create }.to output(stdout_create).to_stdout
    end

    it 'runs the correct git commands' do
      allow_any_instance_of(Thor::Shell::Basic).to receive(:say)
      expect_git_command('tag | sort', 3)
      expect_git_command('tag -a v1.0.1 -m "Version v1.0.1"')
      expect_git_command('push origin --tags')
      expect_git_command('push origin')
      subject.create
    end
  end

  describe '#current' do
    it 'returns the current plus-one' do
      expect { subject.current }.to output("Fetching from origin\nv1.0.0 (1.0.0\u0001.0.1)\n").to_stdout
    end
  end

  def expect_git_command(args, times = 1)
    expect(Cocaine::CommandLine).to receive(:new).with('git', args, {}).exactly(times).times.ordered
  end
end
