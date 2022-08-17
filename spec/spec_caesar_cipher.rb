# frozen_string_literal: false

require './lib/caesar_cipher'

RSpec.describe 'alphabet_downcase' do
  it 'Returns the alphabet in downcase' do
    result = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
    expect(alphabet_downcase).to eql(result)
  end

  it 'Returns the right size of the alphabet' do
    expect(alphabet_downcase.length).to eql(26)
  end
end

RSpec.describe 'get_letter' do
  it 'Returns the letter in position 5' do
    expect(get_letter(5)).to eql('f')
  end

  it 'Returns the letter uppercased letter in position 7' do
    expect(get_letter(7, is_upcase: true)).to eql('H')
  end

  it 'Position overflowed by one returns the letter a' do
    expect(get_letter(26)).to eql('a')
  end

  it 'Position overflowed by 25 positions returns the letter z' do
    expect(get_letter(51)).to eql('z')
  end

  it 'Position overflowed 3 times the alphabet size, returns the letter a' do
    expect(get_letter(alphabet_downcase.length)).to eql('a')
  end
end

RSpec.describe 'caesar_cipher' do
  it 'Returns the same word if the shift is 0' do
    expect(caesar_cipher('abcdefg', 0)).to eql('abcdefg')
  end

  it 'Returns an encrypted word with a shift of 1' do
    expect(caesar_cipher('hello', 1)).to eql('ifmmp')
  end

  it 'Returns an encrypted word with a shift of 3' do
    expect(caesar_cipher('friend', 3)).to eql('iulhqg')
  end

  it 'Encrypts uppercase letters' do
    expect(caesar_cipher('FrienD', 3)).to eql('IulhqG')
  end

  it 'Doesn\'t encrypts spaces or non alphabet letter characters' do
    expect(caesar_cipher('hello, world.', 1)).to eql('ifmmp, xpsme.')
  end

  it 'Decrypts messages by using a negative shift' do
    expect(caesar_cipher('ifmmp, xpsme.', -1)).to eql('hello, world.')
  end
end
