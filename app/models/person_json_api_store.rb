class PersonJsonApiStore
  require 'json'

  def initialize
    @person_store = File.expand_path('../person_json_api_store.json', __FILE__)
  end

  def read
    persons = JSON.parse(File.open(@person_store, 'r'){ |file| file.read }) || {}
    persons.keys.inject({}) { |h, id| h[id.to_i] = Person.new(id.to_i,  persons[id]); h }
  end

  def write(persons)
    persons = persons.values.inject({}) { |h, person| h[person.id] = person.to_h; h }
    File.open(@person_store, 'w'){ |file| file.puts JSON.generate(persons) }
  end
end
