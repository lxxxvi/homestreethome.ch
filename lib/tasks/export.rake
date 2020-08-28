namespace :export do
  namespace :releases do
    desc 'Export releases as json'
    task as_json: :environment do
      output_pathname = Rails.root.join('frontend/public/releases.json')
      output_pathname.write(ReleasesExporter.new.as_json)

      puts "Done. Output written to '#{output_pathname}'"
    end
  end
end
