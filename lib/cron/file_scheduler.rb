require 'rufus-scheduler'

class FileScheduler

  def initialize(file)
    yield file
  end

  # scheduler = Rufus::Scheduler.new

  # scheduler.every '3h' do
  #   puts "change the oil filter!"
  # end
  #
  # scheduler.interval '2h' do
  #   puts "thinking..."
  #   puts sleep(rand * 1000)
  #   puts "thought."
  # end
  #
  # scheduler.cron '00 09 * * *' do
  #   puts "it's 9am! good morning!"
  # end

end