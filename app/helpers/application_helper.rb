module ApplicationHelper
  def twitter_card_info(quiz)
    twitter_card = {}
    if quiz
      twitter_card[:url] = "https://quiz-quiq.herokuapp.com#{quiz_path(quiz)}"
      twitter_card[:title] = 'Quiz共有サービス QuiQ'
      twitter_card[:description] = quiz.body
      twitter_card[:image] = "https://quiz-quiq.herokuapp.com#{image_quiz_path(quiz)}"
    else
      twitter_card[:url] = 'https://quiz-quiq.herokuapp.com/quizzes'
      twitter_card[:title] = 'Quiz共有アプリ QuiQ'
      twitter_card[:description] = 'Quizを投稿して、すぐに共有、すぐに解答'
      twitter_card[:image] = 'https://raw.githubusercontent.com/Madogiwa0124/quiq/master/app/assets/images/top.png'
    end
    twitter_card[:card] = 'summary'
    twitter_card[:site] = '@Madogiwa_Boy'
    twitter_card
  end 
end
