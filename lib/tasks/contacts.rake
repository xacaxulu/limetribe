require 'lime.rb'

namespace :contacts do
  desc "Imports relevant contacts from twitter"
  task :loadup => :environment do
    @contact_importer = ContactImporter.new
    @contact_importer.loadup
  end
end