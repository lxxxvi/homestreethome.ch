namespace :discogs do
  desc 'Synchronize Discogs'
  task synchronize: :environment do
    DiscogsSynchronizer.new.call!
  end
end
