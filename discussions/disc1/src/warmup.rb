def fib(n)
  i = 0
  res = []
  while i < n do
    if i == 0 then
      res.push(0)
    elsif i == 1 then
      res.push(1)
    else
      res.push(res[i-2]+res[i-1])
    end
    i = i+1
  end
  return res
end

def isPalindrome(n)
  s = n.to_s
  s.reverse!
  m = s.to_i
  return m == n;
end

def nthmax(n,a)
  b = a.sort
  b.reverse!
  b[n]
end

def freq(s)
  a = s.chars
  n = a.length
  if n == 0 then
    return ""
  end
  i = 0
  counts = Hash.new(0)
  while i < n do
    counts[a[i]] += 1
    i += 1
  end
  ks = counts.keys
  n = ks.length
  i = 0
  c = a[0]
  max = counts[c]
  while i < n do
    if counts[ks[i]] > max then
      c = ks[i]
      max = counts[c]
    end
    i += 1
  end
  return c
end

def zipHash(arr1, arr2)
  h = {}

  if arr1.length() != arr2.length()
    return nil
  end

  for i in 0...arr1.length()
    h[arr1[i]] = arr2[i]
  end

  return h
end

def hashToArray(hash)
  a = []

  for k in hash.keys
    a << [k, hash[k]]
  end

  return a
end
