# frozen_string_literal: true

RSpec.describe RbenvOpen3 do
  it 'has a version number' do
    expect(RbenvOpen3.version).not_to be nil
  end

  it 'can run using a different Ruby version' do
    open3 = RbenvOpen3.new(version: '2.7.3')

    open3.popen3('gem env') do |_sin, sout, serr, proc|
      puts sout.read
      puts serr.read
    end
  end
end
