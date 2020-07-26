class Gossip
  attr_accessor :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << ["#{@author}" , "#{@content}"]
    end
  end

  def self.all
    all_gossips = Array.new
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
    all_gossips = self.all
    id = id.to_i
    puts all_gossips[id].author
    puts all_gossips[id].content
    return all_gossips[id]
  end


  def self.update(id,author_update, content_update)
    gossips = self.all
    puts n = id.to_i
    CSV.open("./db/gossip.csv", "w") do |csv|
      gossips.each_with_index do |x|
        if n == gossips.index(x)
          csv << [author_update, content_update]
        else
          csv << [x.author , x.content]
        end
      end
    end
  end
end