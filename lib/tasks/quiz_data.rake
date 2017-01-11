desc 'Import quiz data from file'
namespace :quiz_data do

  desc 'import quiz from docsity'
  task upload_docsity: :environment do
    QuizDataHandler.upload_docsity()
  end
end