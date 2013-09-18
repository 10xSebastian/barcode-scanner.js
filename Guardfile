guard 'shell' do
  watch /.*\.(sass|haml|coffee)/ do |m|
    `sh compile.sh`
    `clear`
  end
end
