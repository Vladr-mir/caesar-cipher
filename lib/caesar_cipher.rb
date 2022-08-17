# frozen_string_literal: false

def alphabet_downcase
  %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
end

def get_letter(position, is_upcase: false)
  alpha = alphabet_downcase
  position -= alpha.length until position < alpha.length
  alpha.map!(&:upcase) if is_upcase
  alpha[position]
end

def caesar_cipher(sentence, shift)
  encrypted = sentence.split('')
  alpha = alphabet_downcase

  encrypted.map! do |letter|
    is_upcase = letter.upcase == letter
    position = alpha.find_index(letter.downcase)
    position.nil? ? letter : get_letter(position + shift, is_upcase: is_upcase)
  end
  encrypted.join('')
end
