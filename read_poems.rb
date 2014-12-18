datafiles = File.join("**", "data", "**", "*.txt")
poemfiles = Dir.glob(datafiles)

poems = []
poemfiles.each do |file|
  poems << File.read(file)
end

#have 9 objects in an array, now i need to split them into 9 hashes
array_of_hash_poems = []
poems.each do |poem|
  author = Hash.new
  title = Hash.new
  lines = poem.split(/\n/)
  title[lines[0]] = lines[3..-1]
  author[lines[1]] = title
  array_of_hash_poems << author
end

#now i have an array of 9 hashes, need to make a hash with keys that point to
#several values
hash_of_poems = {}
array_of_hash_poems.each do |poem|
  poem.each do |author, info|
    if hash_of_poems.has_key?(author)
      #got stuck on this line, for a long time, for some reason it
      #won't append to the key, gives me  undefined method `<<' for #<Hash:0x007f8be388fec0>
      #but everywhere I look thats the only method i find to append
      p hash_of_poems[author] << info
    else
      hash_of_poems[author] = info
    end
  end
end

hash_of_poems

#after this I was going to use this "" item in my arrays to count the lines,
#loop thorugh array and when variable = "" count it and store in a variable
#at the end of the loop use the count of the is variable to then:
# if equals 0 then verses equals 1 and lines equal array.length
# if equals 1 then verses equals 2 and lines equals array.lenth-1 and so on
