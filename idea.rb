class Idea
  def save
  end
    def self.delete(position)
    database.transaction do
      database['ideas'].delete_at(position)
    end
  end
 def self.find(id)
  raw_idea = find_raw_idea(id)
  new(raw_idea[:title], raw_idea[:description])
end

def self.find_raw_idea(id)
  database.transaction do
    database['ideas'].at(id)
  end
def self.update(id, data)
  database.transaction do
    database['ideas'][id] = data
  end
end
