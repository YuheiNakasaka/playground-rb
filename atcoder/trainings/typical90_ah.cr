n, k = read_line.split.map(&.to_i32)
arr = read_line.split.map(&.to_i32)
i, j = 0, 0
max = 0
cnt = 0
hash = {} of Int32 => Int32
while i < n
  while j < n
    hash[arr[j]] ||= 0
    hash[arr[j]] += 1
    kind = hash.keys.size
    if kind <= k
      cnt += 1
      max = [max, cnt].max
    else
      hash.delete(arr[j])
      break
    end

    j += 1
  end

  hash[arr[i]] = hash[arr[i]] - 1
  if hash[arr[i]] == 0
    hash.delete(arr[i])
  end

  i += 1
  cnt -= 1
end

puts(max)
