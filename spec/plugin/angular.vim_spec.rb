require 'rspec'
require_relative '../spec_helper'

describe 'check if working directory is an angular app' do
  before do
    test_path = `pwd`
    path = File.expand_path('../../../',__FILE__)
    system "cp -r #{path}/fixtures/app app"
    vim.add_plugin(File.expand_path('../../../',__FILE__), 'plugin/angular.vim')
  end
  it 'edits a file' do
    sample = 'some text'
    vim.edit('test.txt')
    vim.insert(sample)
    vim.write
    expect(File.read('test.txt')).to eql(sample.strip + "\n")
  end

  it 'add a directive' do
    # vim.feedkey
    vim.normal(':ADirective test_dir<cr>yes<cr><cr>:w<cr>')
    sleep(0.1)
    IO.read('app/js/directives.js').should match("test_dir")
  end

  after do
    system "rm -rf app"
  end

end
