# frozen_string_literal: true

require 'spec_helper'
require 'json'

describe 'thundering_herd_resolver::resolve task' do
  let(:task_dir) { File.expand_path(File.join(__dir__, '..', '..', 'tasks')) }
  let(:metadata_file) { File.join(task_dir, 'resolve.json') }
  let(:shell_impl) { File.join(task_dir, 'resolve.sh') }
  let(:powershell_impl) { File.join(task_dir, 'resolve.ps1') }
  let(:metadata) { JSON.parse(File.read(metadata_file)) }

  it 'ships a metadata file' do
    expect(File).to exist(metadata_file)
  end

  it 'contains valid JSON metadata' do
    expect { JSON.parse(File.read(metadata_file)) }.not_to raise_error
  end

  it 'declares a supported puppet_task_version' do
    expect(metadata['puppet_task_version']).to eq(1)
  end

  it 'has a non-empty description' do
    expect(metadata['description']).to be_a(String)
    expect(metadata['description']).not_to be_empty
  end

  it 'declares parameters as an object' do
    expect(metadata['parameters']).to be_a(Hash)
  end

  describe 'cross-platform implementation selection' do
    it 'declares two implementations' do
      expect(metadata['implementations']).to be_an(Array)
      expect(metadata['implementations'].length).to eq(2)
    end

    it 'maps the shell feature to the bash implementation' do
      shell = metadata['implementations'].find { |i| i['requirements'] == ['shell'] }
      expect(shell).not_to be_nil
      expect(shell['name']).to eq('resolve.sh')
    end

    it 'maps the powershell feature to the powershell implementation' do
      ps = metadata['implementations'].find { |i| i['requirements'] == ['powershell'] }
      expect(ps).not_to be_nil
      expect(ps['name']).to eq('resolve.ps1')
    end

    it 'ships every implementation file referenced in the metadata' do
      metadata['implementations'].each do |impl|
        expect(File).to exist(File.join(task_dir, impl['name']))
      end
    end
  end

  describe 'shell (bash) implementation' do
    let(:contents) { File.read(shell_impl) }

    it 'resolves the AIO puppet binary path for Bolt/PE orchestrator runs' do
      expect(contents).to include('/opt/puppetlabs/bin')
    end

    it 'sleeps a random delay bounded by runinterval, then restarts the service' do
      expect(contents).to match(%r{RANDOM % runinterval})
      expect(contents).to match(%r{resource service puppet ensure=running})
    end
  end

  describe 'powershell implementation' do
    let(:contents) { File.read(powershell_impl) }

    it 'invokes puppet via the call operator for spaced-path robustness' do
      expect(contents).to match(%r{&\s+\$puppet})
    end

    it 'casts the runinterval to an integer' do
      expect(contents).to match(%r{\[int\]})
    end

    it 'sleeps a random delay bounded by runinterval, then restarts the service' do
      expect(contents).to match(%r{Get-Random})
      expect(contents).to match(%r{resource service puppet ensure=running})
    end
  end
end
