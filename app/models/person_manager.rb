class PersonManager

  def initialize(store)
    @store = store
    @persons = @store.read
  end

  def to_json
    { result: @persons.map { |id, obj| obj }, count: persons_count }.to_json
  end

  def persons_count
    @persons.keys.count
  end

  def max_id
    @persons.keys.max.to_i  || 0
  end

  def each_person
    @persons.each_key do |id|
      yield @persons[id]
    end
  end

  def save_persons
    @store.write(@persons)
  end

  def get_person(id)
    @persons[id]
  end

  def set_person(person)
    @persons[person.id] = person if person
  end

  def remove_person(person)
    @persons.delete(person.id)  if person
  end
end
