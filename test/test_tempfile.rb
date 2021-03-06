assert('Tempfile remove tempfile (when GC run)') do
  t = Tempfile.new 'test'
  path = t.path
  assert_true File.exist?(path)
  t.close false
  assert_true File.exist?(path)
  t = nil
  GC.start
  assert_false File.exist?(path)
end

assert('Tempfile remove tempfile (call Tempfile#close with real = true)') do
  t = Tempfile.new 'test'
  path = t.path
  assert_true File.exist?(path)
  t.close true
  assert_false File.exist?(path)
end
