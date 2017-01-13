module QuizDataHandler
  extend self

  def upload_exam(file_name)
    data = YAML.load_file(data_path(file_name)).with_indifferent_access

    quiz = Quiz.create!(due_date: data.fetch(:quiz).fetch(:date))
    data.fetch(:questions).each do |h|
      q = Question.create!(text: h.fetch(:content), quiz_id: quiz.id)
      h.fetch(:answers).each { |a| Answer.create!(text: a, question: q) }
    end   
  end

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