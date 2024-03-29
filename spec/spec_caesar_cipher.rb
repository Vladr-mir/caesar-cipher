# frozen_string_literal: false

require './lib/caesar_cipher'

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
