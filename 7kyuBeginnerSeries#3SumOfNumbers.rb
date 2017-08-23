def get_sum(_a, _b)
  return _a unless _a != _b
  ans = 0
  if _a < _b
    (_a.._b).each { |num| ans += num }
  else
    (_b.._a).each { |num| ans += num }
  end
  puts ans
  ans
end

get_sum(5, -1)
