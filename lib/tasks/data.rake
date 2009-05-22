namespace :companies do
  namespace :testdata do
    task :create => :delete do
      print "Creating ..."
      (1..100).each do |count|             
        print "."; STDOUT.flush
        address = %w(Munich Frankfurt London Chicago Moscow)[rand(4)]
        c = Company.create({
          :name => "Company #{count}",
          :address => "#{address}"
        })
        (1 + rand(20)).times do                                            
          first = rand(10).to_s                        
          last = rand(10).to_s                        
          c.people.create({:first => "First_#{first}", :last => "Last_#{last}"})
        end
      end                     
      puts "done."
    end
    task :delete => :environment do
      print "Deleting ..."; STDOUT.flush
      Company.delete_all
      Person.delete_all
      puts "done."
    end
  end
end
