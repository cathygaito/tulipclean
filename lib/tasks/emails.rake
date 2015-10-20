namespace :emails do
  desc "This task does nothing"
  task :nothing do
    DanielTest.fake_email.deliver_now
  end
end
