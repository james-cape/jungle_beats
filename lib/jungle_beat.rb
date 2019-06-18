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

  def play
    `say -r 240 "#{@list.to_string}"`
  end
end
