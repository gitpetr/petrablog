class PersonSessionStore

  def initialize(session)
    @session = session
  end

  def read
    persons = @session[:persons] || {}
    persons.keys.inject({}) { |h, id| h[id.to_i] = Person.new(id.to_i,  persons[id]); h }
  end

  def write(persons)
    @session[:persons] = persons.values.inject({}) { |h, person| h[person.id] = person.to_h; h }
  end
end
