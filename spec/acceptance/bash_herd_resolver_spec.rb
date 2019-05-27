require 'spec_helper_acceptance'
describe 'tasks' do
  it 'testing puppet restarts ' do
    run_shell('/opt/puppetlabs/bin/puppet config set runinterval 10')
    result = run_bolt_task('thundering_herd_resolver::bash_herd_resolver')
    expect(result.first['result']['_output']).to contain('running')
    expect(result.first['result']['_output']).to contain('stopped')
  end
end
