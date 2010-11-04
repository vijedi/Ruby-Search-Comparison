class CreateBasicModel < ActiveRecord::Migration
    def self.up
        create_table :users do |t|
            t.string :first_name
            t.string :last_name
            t.text   :data
        end

        names = []
        File.open("data/dist.male.first").each_line do |line|
            names << line.split(/\s+/)[0]
        end
        
        file = File.open("data/down_and_out_in_the_magic_kingdom.txt")
        
        (1..10).each do 
            while(text = file.read(512)) do 
                User.create(:first_name => names[(names.length * rand).to_i], 
                        :last_name => names[(names.length * rand).to_i],
                        :data => text)
            end
        end
    end

    def self.down
      drop_table :users
    end
end
