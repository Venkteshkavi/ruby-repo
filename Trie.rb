class Trie
    attr_accessor :store
    EOW = "eow".freeze
=begin
    Initialize your data structure here.
=end
    def initialize()
        @store = {}
    end

=begin
    Inserts a word into the trie.
    :type word: String
    :rtype: Void
=end
    def insert(word)
        curr = store
        word.each_char do |chr|    
            curr[chr] = {} unless curr[chr]
            curr = curr[chr]
        end
        curr[EOW] = true      
    end

=begin
    Returns if the word is in the trie.
    :type word: String
    :rtype: Boolean
=end
    def search(word, check_eow = true)
        curr = store
        word.each_char do |c|
            curr = curr[c]
            return false if curr.nil?
        end
        check_eow ? curr.key?(EOW) : true        
    end

=begin
    Returns if there is any word in the trie that starts with the given prefix.
    :type prefix: String
    :rtype: Boolean
=end
    def starts_with(prefix)
        search(prefix, false)
    end
end

words = Trie.new

words.insert("Trie")
words.insert("check")
words.insert("progress")

p "Normal search - Word: #{ARGV[0]}, status: #{words.search(ARGV[0])}"

p "Prefix search - Word: #{ARGV[1]}, status: #{words.starts_with(ARGV[1])}"

p "Normal search - Word: #{ARGV[2]}, status: #{words.search(ARGV[2])}"

