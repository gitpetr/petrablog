class Person

  READ_FIELDS = %i(id)
  WRITE_FIELDS = %i(name email date_of_birth salary)
  ALL_FIELDS = READ_FIELDS + WRITE_FIELDS

  READ_FIELDS.each { |field| attr_reader field }
  WRITE_FIELDS.each { |field| attr_accessor field }

  def initialize(id, attrs)
    @id = id
    WRITE_FIELDS.each { |field| self.send("#{field}=", attrs[field.to_s])}
  end

  def to_h
    ALL_FIELDS.inject({}) { |h, field| h[field] = send(field); h }
  end

end


