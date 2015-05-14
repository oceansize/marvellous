class Comic < Struct.new :data

  def method_missing(meth, *attr, &block)
    if data.keys.include?(meth.to_s)
      return data[meth.to_s]
    else
      super
    end
  end
end
