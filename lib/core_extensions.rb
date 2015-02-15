class Array
  def to_str(spliter = ", ")
    join(spliter)
  end
end

class String
  def to_str(*args)
    self
  end
end

class Hash
  def except_key(hash_key)
    tap { |hash| hash.delete(hash_key) }
  end

  def method_missing(name, *args)
    name = name.to_s
    name.gsub!("_", " ")
    self[name]
  end
end
