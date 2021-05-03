require 'csv'

class Gossip
    attr_accessor :author, :content

    def initialize(author, content)
      @content = content
      @author = author
    end

    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
          csv << [@author, @content]
        end
    end

    def self.all
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
    end

    def self.find(id)
		return Gossip.all[id.to_i - 1]
	end

    def self.update(id, gossip_author, gossip_content)
        all_gossips = self.all
        all_gossips[id.to_i - 1].author = gossip_author
        all_gossips[id.to_i - 1].content = gossip_content
        CSV.open("./db/gossip.csv", "w") { |csv| all_gossips.each { |gossip| gossip.save }}
    end
end