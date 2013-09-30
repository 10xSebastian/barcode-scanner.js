begin
  require 'jasmine'
  load 'jasmine/tasks/jasmine.rake'
rescue LoadError
  task :jasmine do
    abort "Jasmine is not available. In order to run jasmine, you must: (sudo) gem install jasmine"
  end
end

namespace :travis do
  task :test do

    require 'rubygems'
    require 'capybara'
    require 'capybara/dsl'

    Capybara.run_server = false
    Capybara.current_driver = :selenium
    Capybara.app_host = 'https://rawgithub.com'

    include Capybara::DSL
    visit("/spape/barcode-scanner.js/master/SpecRunner.html")

    if not page.text[/Passing \d+ specs/].nil? and page.text[/Failing \d+ spec/].nil?
      exit 0
    else
      exit 1
    end

  end
end