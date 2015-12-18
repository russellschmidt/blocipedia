module RandomData

  def random_word(len)
    letters = ('a'..'z').to_a
    letters.shuffle!
    letters[0..len].join
  end

  def random_sentence
    strings = []
    rand(3..12).times do
      random_number = rand(1..12)
      strings << random_word(random_number)
    end
    sentence = strings.join(" ")
    sentence.capitalize << "."
  end

  def random_paragraph
    sentences = []
    rand(3..7).times do
      sentences << random_sentence
    end
    sentences.join(" ")
  end

  def random_email
    "#{random_word(rand(3..10))}@#{random_word(rand(3..10))}.#{random_word(3)}"
  end

  def random_password
    # password has to be 8 characters minimum for Devise
    random_word(8)
  end

end
