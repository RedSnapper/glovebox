namespace :admin do
  task :create => :environment do
    desc "Create an admin"
    puts "Enter the new user's email address:"
    email = STDIN.gets
    puts "Enter the new user's password:"
    password = STDIN.gets
    if admin = Admin.create!(:email => email, :password => password)
      puts "Created admin: #{email}"
    else
      puts admin.errors
    end
  end
end
