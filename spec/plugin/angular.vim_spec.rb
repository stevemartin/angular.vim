require 'rspec'
require_relative '../spec_helper'

describe 'check if working directory is an angular app' do
  before do
    vim.add_plugin(File.expand_path('../../../',__FILE__), 'plugin/angular.vim')
  end
  it 'edits a file' do
    sample = 'some text'
    vim.edit('test.txt')
    vim.insert(sample)
    vim.write
    expect(File.read('test.txt')).to eql(sample.strip + "\n")
  end

  it 'runs the directive' do
    # vim.feedkey
    vim.command('ADirectives')
  end
end
