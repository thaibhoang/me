namespace :admin do
  desc "Bootstrap admin user from environment variables"
  task bootstrap: :environment do
    email = ENV.fetch("ADMIN_EMAIL", "").strip.downcase
    password = ENV.fetch("ADMIN_PASSWORD", "")

    if email.empty? || password.empty?
      abort "Missing ADMIN_EMAIL or ADMIN_PASSWORD"
    end

    admin = AdminUser.find_or_initialize_by(email: email)
    admin.password = password
    admin.password_confirmation = password
    admin.save!

    puts "Admin user is ready: #{admin.email}"
  end
end
