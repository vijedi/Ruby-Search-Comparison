namespace :bench do 
    require 'set'
    
    desc "Run some searches and track the time"
    task :run => :environment do 
        puts ""
        puts "Ruby Search Benchmark:"
        puts "You have to run the benchmark for either Solr or Thinking Sphinx branch"
        puts ""
        puts "Refer to the README for directions"
    end
end
