module QuizFormatter
  extend self

  def parse_file
    @parse_file ||= File.open('quiz_docsity').readlines()[1..-1].map(&format_lines)
  end

  def process_qa
    ->(qa) { {content: is_question?(qa[0]), answers: qa[1..-1].map{|a| is_answer?(a)} } }
  end

  def process_file
    parse_file.each_slice(4).to_a.map(&process_qa)
  end

  def export_json
    File.open('quiz_docsity.json', 'w') do |f|
      f.write(JSON.pretty_generate({questions: process_file}))
    end
  end

  def empty_question
    @empty_question ||= {
      content: '',
      answers: []
    }
  end

  private

  def is_question?(string)
    m = /^\d+{1,2}\./.match(string)
    m.nil? ? m : string.gsub(m.to_s, '').strip
  end

  def format_lines
    ->(l){ l.include?("\r\n") ? l.gsub("\r\n", '') : l }
  end

  def is_answer?(string)
    m = /^(a|b|c)\)/.match(string)
    m.nil? ? m : string.gsub(m.to_s, '').strip
  end
end
