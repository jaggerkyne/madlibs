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

def replacing_words!(sentence, word, dictionary)
  sentence.gsub!(word).each do
    dictionary.sample
  end
end

exit_with("No input file") if ARGV.empty?
exit_with("File does not exist!") if !File.exists?(ARGV[0])

nouns_list = read_file("nouns.txt")
verbs_list = read_file("verbs.txt")
adjectives_list = read_file("adjectives.txt")
adverbs_list = read_file("adverbs.txt")

original = read_content("sample.txt")

dictionary = {noun: nouns_list, verbs: verbs_list, 
                      adjectives: adjectives_list, adverbs: adverbs_list}


begin
  system "clear"
  puts "Welcome to joke maker!"

  string_to_modify = original.dup  
  
  replacing_words!(string_to_modify, 'NOUN', dictionary[:noun])
  replacing_words!(string_to_modify, /\bVERB/, dictionary[:verbs])
  replacing_words!(string_to_modify, 'ADJECTIVE', dictionary[:adjectives])
  replacing_words!(string_to_modify, /\bADVERB\b/, dictionary[:adverbs])

  puts string_to_modify
  puts "More joke? y/n"
  decision = STDIN.gets.chomp
end until decision != 'y'



