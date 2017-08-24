
def in_array(array1, array2)
  r = []
  array1.each do |word|
    array2.each do |word2|
      r << word if word2.include? word unless r.include? word
    end
  end
  r.sort!
end
a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
in_array(a1, a2)
