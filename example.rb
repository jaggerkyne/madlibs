# begin # when I put begin here, the code will reload
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
# begin # when I put begin here, the code will reload
original = read_content("sample.txt")
# begin # when I put begin here, the code will not reload
dictionary = {noun: nouns_list, verbs: verbs_list, 
                      adjectives: adjectives_list, adverbs: adverbs_list}

# Problem: no new joke will be generated when user typed y.
# Problem: use regex to match the exact words we target. ADVERBS AND VERBS clash to one another.
begin # when I put begin here, no joke will not reload
  system "clear"
  puts "Welcome to joke maker!"
  original.gsub!('NOUN').each do 
    dictionary[:noun].sample
  end
  original.gsub!('VERB').each do
    dictionary[:verbs].sample
  end
  original.gsub!('ADJECTIVE').each do
    dictionary[:adjectives].sample
  end
  original.gsub!('XXX').each do
    dictionary[:adverbs].sample
  end
  puts original
  puts "More joke? y/n"
  decision = STDIN.gets.chomp
end until decision != 'y'



