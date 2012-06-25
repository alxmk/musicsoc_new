namespace :db do
  desc "Reset database at the end of the year"
  task :initialise_database => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create(email: "su9music@bath.ac.uk", password: "password", 
                        password_confirmation: "password")
    admin.toggle!(:confirmed)
    admin.toggle!(:admin)
  end
end