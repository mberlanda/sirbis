desc 'Import quiz data from file'
namespace :quiz_data do

  desc 'import quiz from docsity'
  task upload_docsity: :environment do
    QuizDataHandler.upload_docsity()
  end

  desc 'import quiz from exams'
  task upload_exams: :environment do
    QuizDataHandler.upload_exam('domande_tributario20130528.yml')
    QuizDataHandler.upload_exam('domande_tributario20141217.yml')
  end

end