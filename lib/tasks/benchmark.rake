namespace :bench do 
    require 'set'
    
    desc "Run some searches and track the time"
    task :run => :environment do 
        wordSet = Set.new
        
        # Use the seed data to seed the searches. We want some randomness to distribute the data
        File.open(RAILS_ROOT + "/data/down_and_out_in_the_magic_kingdom.txt").each_line do |line| 
            line.strip.split(/\s+/).each {|word| wordSet << word.gsub(/\W/, '')}
        end
        
        words = wordSet.to_a
        
        runs = 0
        max = 50000
        frequency = 1000
        
        time = Time.now
        sectionTime = Time.now
        
        matches_found = 0
        while(runs < max)
            # Randomly pick a word that we found in the text
            begin 
                word = words[(words.size * rand).to_i]
                search = User.search do 
                    keywords(word)
                end
            
                # Do something with the result so a load is forced
                matches_found += search.results.length
                runs += 1
                if(runs % frequency == 0) 
                    puts ('Run: ' + runs.to_s + ' Time: ' + (Time.now - sectionTime).to_s + ' seconds')
                    sectionTime = Time.now
                end
            rescue 
            end
        end
        endTime = Time.now
        
        totalTime = (endTime - time)
        
        puts ('Completed ' + max.to_s + ' runs')
        puts ('Total time ' + totalTime.to_s + ' seconds. Found ' + matches_found + ' records')
    end
end
