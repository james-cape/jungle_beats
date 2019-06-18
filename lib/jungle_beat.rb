class JungleBeat

  attr_reader :list
  def initialize
    @list = LinkedList.new
  end

  def append(datas)
    datas.split.each { |data| @list.append(data) }
  end

  def count
    @list.count
  end
end
