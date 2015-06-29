def method1
  method2
end

def method2
  method3("Fixed it!")
end

def method3(a)
  puts a
end

method1
