# frozen_string_literal: true

require 'database_cleaner/active_record'

puts "\t\t\t---===[ Cleaning up DB... ]===---" # rubocop:disable Rails/Output
DatabaseCleaner.clean_with :truncation
DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

puts "\t\t\t---===[ Cleaning up ./storage dir... ]===---" # rubocop:disable Rails/Output
FileUtils.rm_r Dir.glob('./storage/*')

%w[
  admins
  categories
  doctors
  users
  appointments
].each do |seed_file|
  require File.expand_path("../seeds/#{seed_file}", __FILE__)
end
