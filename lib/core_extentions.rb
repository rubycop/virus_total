class Hash
  def method_missing(name, *args)
    name = name.to_s
    name.gsub!("_", " ")
    self[name]
  end
end
