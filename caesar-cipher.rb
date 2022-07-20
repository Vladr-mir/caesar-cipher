def get_letter(position, is_upcase = false)
  if is_upcase then
    (position + "A".ord).chr
  else
    (position + "a".ord).chr
  end
end

def get_alphabet_downcase() 
  Array.new(26).map.with_index {|letter, index| get_letter(index)}
end

def get_alphabet_upcase()
  Array.new(26).map.with_index {|letter, index| get_letter(index, true)}
end

def is_punctuation?(letter) 
  result = false
  punctuation = ["\s", ".", "!", "?", "\t"]
  punctuation.each { |mark| result = true if mark == letter }
  result
end

def caesar_cipher(sentence, shift)
  encrypted = []
  fixed_index = 0
  alphabet_downcase = get_alphabet_downcase
  alphabet_upcase = get_alphabet_upcase

  sentence.split("").each do |sentence_letter|
    encrypted.push(sentence_letter) if is_punctuation?(sentence_letter)
  
    alphabet_downcase.each.with_index do |letter, index|
      fixed_index = index + shift
      fixed_index -= 26 unless fixed_index.between?(0, 26)

      encrypted.push(alphabet_downcase[fixed_index]) if sentence_letter == letter
    end

    alphabet_upcase.each.with_index do |letter, index|
      fixed_index = index + shift
      fixed_index -= 26 unless fixed_index.between?(0, 26)

      encrypted.push(alphabet_upcase[fixed_index]) if sentence_letter == letter
    end
  end
  encrypted.join
end

