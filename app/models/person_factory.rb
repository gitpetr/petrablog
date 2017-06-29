class PersonFactory

  def initialize(max_id)
    @last_created_id = max_id
  end

  def build(attrs)
    Person.new(@last_created_id += 1, attrs)
  end

end
