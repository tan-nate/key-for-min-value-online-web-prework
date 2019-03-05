# prereqs: iterators, hashes, conditional logic
# Given a hash with numeric values, return the key for the smallest value

require 'pry'

hash = {}

hash = {:table => 85, :chair => 25, :mattress => 450, :hammer => 2, :laser => 100, :desk => 80}

def values(hash)
  hash.collect do |key, value|
    value
  end
end

def my_sort(array)
  i = 0
  while i < (array.length - 1)
    if yield(array[i], array[i + 1]) == -1
      i += 1
    elsif yield(array[i], array[i + 1]) == 0
      i += 1
    else
      array[i], array[i + 1] = array[i + 1], array[i]
      i = 0
    end
  end
  
  array
end

def sorted_array(hash)
  my_sort(values(hash)) do |a, b|
    a <=> b
  end
end

def key_for_min_value(hash)
  if hash == {}
    nil
  else
    lowest_value = sorted_array(hash)[0]
    lowest_value_index = values(hash).index(lowest_value)
    keys = hash.collect do |key, value|
      key
    end
    keys[lowest_value_index]
  end
end

binding.pry