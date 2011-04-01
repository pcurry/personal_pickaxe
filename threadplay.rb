
require 'net/http'
pages = %w{ www.rubycentral.com slashdot.org www.google.com }
threads = []
for page_to_fetch in pages
  threads << Thread.new(page_to_fetch) do |url|
    h = Net::HTTP.new(url, 80)
    puts "Fetching: #{url}\n"
    resp = h.get('/', nil)
    puts "Got #{url}: #{resp.message}\n"
  end
end
threads.each {|thr| thr.join }

count = 0
threads = []
10.times do |i|
  threads[i] = Thread.new do 
    sleep(rand(0.1))
    Thread.current["mycount"] = count
    count += 1
  end
end
threads.each {|t| t.join; print t["mycount"], ", " }
puts "count = #{count}"

