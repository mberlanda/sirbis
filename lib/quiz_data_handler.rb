module QuizDataHandler
  extend self

  def upload_docsity
    parse_file('quiz_docsity.json').fetch(:questions).each do |h|
      q = Question.create!(text: h.fetch(:content))
      h.fetch(:answers).each { |a| Answer.create!(text: a, question: q) }
    end
  end

  private

  def parse_file(*args)
    JSON.parse(File.read(data_path(*args))).with_indifferent_access
  end

  def data_path(*args)
    Rails.root.join('data', *args)
  end
end