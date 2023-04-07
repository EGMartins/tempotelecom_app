class GenerateRandomTaskJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    task = Task.new(name: Faker::Lorem.word, description: Faker::Lorem.sentence, complete: false)
    task.save!
    sleep(10)
  end
end
