#cleans out names that are over the age of 13
namespace :cleaner do
  desc "TODO"
  task all_entries: :environment do
  	current_date = Date.today
  	Entry.all.each do |ent|
  		if ent.tested && (ent.age + ((current_date-ent.tested)/365) >= 13)
  			diff = ((current_date-ent.tested)/365).to_i
  			puts 'deleting ' + ent.lname + ',' + ent.fname + '='+diff.to_s
  			ent.destroy
  		end
  	end
  end

end
