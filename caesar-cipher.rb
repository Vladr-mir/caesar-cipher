def get_letter(position, is_upcase: false)
  if is_upcase
    (position + 'A'.ord).chr
  else
    (position + 'a'.ord).chr
  end
end

def alphabet_downcase
  Array.new(26).map.with_index { |_, index| get_letter(index) }
end

def alphabet_upcase
  Array.new(26).map.with_index { |_, index| get_letter(index, true) }
end

def punctuation?(letter)
  result = false
  punctuation = ["\s", ',', '.', '!', '?', "\t"]
  punctuation.each { |mark| result = true if mark == letter }
  result
end

def caesar_cipher(sentence, shift)
  encrypted = []
  fixed_index = 0
  alphabet_down = alphabet_downcase
  alphabet_up = alphabet_upcase

  sentence.split('').each do |sentence_letter|
    encrypted.push(sentence_letter) if punctuation?(sentence_letter)
    alphabet_down.each.with_index do |letter, index|
      fixed_index = index + shift
      fixed_index -= 26 unless fixed_index.between?(0, 26)

      encrypted.push(alphabet_down[fixed_index]) if sentence_letter == letter
    end

    alphabet_up.each.with_index do |letter, index|
      fixed_index = index + shift
      fixed_index -= 26 unless fixed_index.between?(0, 26)

      encrypted.push(alphabet_up[fixed_index]) if sentence_letter == letter
    end
  end
  encrypted.join
end
