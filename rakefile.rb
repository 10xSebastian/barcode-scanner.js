require 'capybara-jasmine'

Capybara::Jasmine::TestTask.new "capyspec" do |t|

  Capybara.javascript_driver = :selenium

  # Like Rake::TestTask, tell it what your lib files are.
  # Here, I'm mixing some files that must come first (order dependent)
  # with some wildcard searches, and then uniqing so they don't show up
  # multiple times and overwrite each other
  t.lib_files = ([
    "vendor/jquery.2.0.3.min.js",
    "spec/javascripts/helpers/key-event.js",
    "spec/javascripts/helpers/expect-submit.js"
  ] + FileList["barcode-scanner.js"]).uniq

  # Lastly, our spec files. This can just be a wildcard in my case
  t.spec_files = FileList["spec/**/*Spec.js"]
end