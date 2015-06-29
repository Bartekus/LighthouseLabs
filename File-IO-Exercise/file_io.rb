#########################################
### Creating a file and writing to it ###
#########################################
fname = "sample.txt"
somefile = File.open(fname, "w") 
somefile.puts "Hello file!"
somefile.close

# First and second line can be combined:
somefile = File.open("sample.txt", "w")
somefile.puts "Hello file!"
somefile.close

# Written using block notation
File.open("sample.txt", "w"){ |somefile| somefile.puts "Hello file!"}

# File.open vs open
require "open-uri"

remote_base_url = "http://en.wikipedia.org/wiki"
remote_page_name = "Ada_Lovelace"
remote_full_url = remote_base_url + "/" + remote_page_name

remote_data = open(remote_full_url).read
my_local_file = open("my-downloaded-page.html", "w") 

my_local_file.write(remote_data)
my_local_file.close


# Exercise: Copy Wikipedia's front page to a file using block notation
require 'rubygems'
require 'rest-client'

wiki_url = "http://en.wikipedia.org/"
wiki_local_filename = "wiki-page.html"

File.open(wiki_local_filename, "w") do |file|
   file.write(RestClient.get(wiki_url))
end 



#########################################
### Reading from a file               ###
#########################################
file = File.open("sample.txt", "r")
contents = file.read
puts contents   #=> Lorem ipsum etc.

contents = file.read
puts contents   #=> ""

# block format
contents = File.open("sample.txt", "r"){ |file| file.read }
puts contents
#=>   Lorem ipsum etc.

# Using readline and readlines
File.open("sample.txt").readlines.each do |line|
   puts line
end

# Usualy in a loop
file = File.open("sample.txt", 'r')
while !file.eof?
   line = file.readline
   puts line
end

# Exercise: Use readlines and the each_with_index method that we used in the enumerables chapter:
require 'open-uri'         
url = "http://ruby.bastardsbook.com/files/fundamentals/hamlet.txt"
local_fname = "hamlet.txt"
File.open(local_fname, "w"){|file| file.write(open(url).read)}

File.open(local_fname, "r") do |file|
   file.readlines.each_with_index do |line, idx|
      puts line if idx % 42 == 41
   end   
end


# Exercise: Print only Hamlet's lines
is_hamlet_speaking = false
File.open("hamlet.txt", "r") do |file|
   file.readlines.each do |line|

      if is_hamlet_speaking == true && ( line.match(/^  [A-Z]/) || line.strip.empty? )
        is_hamlet_speaking = false
      end

      is_hamlet_speaking = true if line.match("Ham\.")

      puts line if is_hamlet_speaking == true
   end   
end



#########################################
### Closing files                     ###
#########################################

# close method
datafile = File.open("sample.txt", "r")
lines = datafile.readlines         
datafile.close

lines.each{ |line| puts line }


# Or, you can pass a block into File.open. At the end of the block, the file is automatically closed:
lines = File.open("sample.txt", "r"){ |datafile| 
   datafile.readlines
}

lines.each{|line| puts line}



#########################################
### File existence and properties     ###
#########################################

# File.exists?
if File.exists?(filename)
   puts "#{filename} exists"
end

# Check whether a directory exists. If false, then I use the Dir.mkdir class method to create it:
dirname = "data-files"
Dir.mkdir(dirname) unless File.exists?dirname
File.open("#{dirname}/new-file.txt", 'w'){|f| f.write('Hello world!')}


# Exercise: Find the top 10 largest files
DIRNAME = "data-hold"

hash = Dir.glob("#{DIRNAME}/**/*.*").inject({}) do |hsh, fname|
   ext = File.basename(fname).split('.')[-1].to_s.downcase
   hsh[ext] ||= [0,0]
   hsh[ext][0] += 1
   hsh[ext][1] += File.size(fname)   
   hsh
end               
File.open("file-analysis.txt", "w") do |f|
   hash.each do |arr|
     txt = arr.flatten.join("\t")
      f.puts txt
      puts txt
   end
end

# Exercise: Read a text file and create a Google Chart
require 'open-uri'

BASE_URL = "https://chart.googleapis.com/chart?cht=p&chs=500x300"
rows = File.open("file-analysis.txt"){|f| f.readlines.map{|p| p.strip.split("\t")} }

headers = rows[0]
[1,2].each do |idx|
   labels = []
   values = []
   rows[1..-1].each do |row|
      labels << row[0]
      values << row[idx]
   end
   
   remote_google_img = URI.encode"#{BASE_URL}&chl=#{labels.join('|')}&chd=t:#{values.join(',')}"
puts remote_google_img
  File.open('file-pie-chart.png', 'w'){|f| 
    f.write(open(remote_google_img))
  }
end