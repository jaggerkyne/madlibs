def say(msg)
  puts "=> #{msg}"
end

def exit_with(msg)
  say msg
  exit
end

def read_file(file_name)
  File.open(file_name, "r") {|f| f.read}.split(" ")
end

def read_content(file)
  content = File.open(ARGV[0], "r") do |f|
    f.read
  end
end

exit_with("No input file") if ARGV.empty?
exit_with("File does not exist!") if !File.exists?(ARGV[0])

nouns_list = read_file("nouns.txt")
verbs_list = read_file("verbs.txt")
adjectives_list = read_file("adjectives.txt")
adverbs_list = read_file("adverbs.txt")

dictionary = {NOUN: nouns_list, verbs: verbs_list, adjectives: adjectives_list, adverbs: adverbs_list}


original = read_content("sample.txt")

puts "Welcome to joke maker!"

# Todo: no new joke will be generated when user typed n.
# Todo: use regex to match the exact words we target.
begin
  system "clear"
  original.gsub!('NOUN').each do 
    nouns_list.sample
  end
  original.gsub!('VERB').each do
    verbs_list.sample
  end
  original.gsub!('ADJECTIVE').each do
    adjectives_list.sample
  end
  original.gsub!('XXX').each do
    adverbs_list.sample
  end
  puts original
  puts "quit? y/n"
  decision = STDIN.gets.chomp
end until decision == 'y'

