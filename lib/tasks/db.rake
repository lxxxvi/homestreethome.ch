namespace :db do
  desc 'Export database to ./data'
  task export: :environment do
    database_name = ActiveRecord::Base.connection_config[:database]
    command = [
      'pg_dump',
      '--format=custom',
      database_name,
      '>',
      Rails.root.join("data/#{database_name}.dump")
    ].join(' ')

    print "\nExecuting '#{command}'"
    system(command)
    puts " ... done!"
  end

  desc 'Import database from ./data'
  task import: :environment do
    database_name, database_username = ActiveRecord::Base.connection_config.values_at(:database, :username)

    username_option = "-U #{database_username}" if database_username.present?
    database_option = "-d #{database_name}"
    input_path = Rails.root.join("data/#{database_name}.dump")

    command = [
      'pg_restore',
      '--verbose --create --clean --no-acl --no-owner',
      "-h localhost",
      database_option,
      input_path
    ].join(' ')

    print "\nExecuting '#{command}'"
    system(command)
    puts " ... done!"
  end
end
