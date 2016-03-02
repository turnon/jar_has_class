class Array

  alias_method :old_map, :map

  def map(t = nil,&b)
    return old_map &b if t.nil? or t == 1

    groups = each_slice(size/t + size%t).to_a

    threads = groups.size.times.map do |g|
      Thread.new do
        Thread.current[:g] = groups[g].map &b
      end
    end

    result = []

    threads.each do |t|
      t.join
      result += t[:g]
    end

    result

  end
end