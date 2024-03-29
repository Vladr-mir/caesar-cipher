# frozen_string_literal: false

def caesar_cipher(phrase, shift)
  alpha = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
  alpha_length = alpha.length

  result = phrase.split('').map do |letter|                             # Map the result
    letter_downcase = letter.downcase

    position = (letter_downcase.ord - 97) + shift                       # Get the position
    position -= alpha_length if position >= alpha_length                # Wrap around
    next letter unless alpha.any? { |item| item == letter_downcase }    # Guard clause if there is no letter in alpha

    letter == letter.upcase ? alpha[position].upcase : alpha[position]  # Get character
  end
  result.join('')
end
