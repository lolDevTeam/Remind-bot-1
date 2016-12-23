def cronjobs_start
	scheduler = Rufus::Scheduler.new
	scheduler.cron '*/1 * * * *' do
		clock=Time.new
		puts "[#{clock.inspect}] Checking for reminders"

		Dir["botfiles/reminders/*"].each { |file| 

			userid = file
			userid.slice! "botfiles/reminders/"
			puts "Checking reminders for: #{userid}"
			userreminders = loadArr(userreminders, file)
			puts "User has #{userreminders/2} reminders"
#			pos = 0
#			begin
#				t4 = userreminders[pos]
#				t4 = Time.parse(t4)
#				if t4.past?




#				pos += 2
#			end while pos < userreminders.length
		}
	end
	scheduler.cron '5 */3 * * *' do
		$bot.stop
	end
	puts 'Cron jobs scheduled!'
end