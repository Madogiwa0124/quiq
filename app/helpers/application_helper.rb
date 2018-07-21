module ApplicationHelper
  def twitter_card_info(quiz)
    twitter_card = quiz ? quiz_show_card_info(quiz) : quiq_card_info
    twitter_card[:card] = 'summary_large_image'
    twitter_card[:site] = '@Madogiwa_Boy'
    twitter_card
  end

  private

  def quiz_show_card_info(quiz)
    {
      url: "https://quiz-quiq.herokuapp.com#{quiz_path(quiz)}",
      title: 'Quiz共有サービス QuiQ',
      description: quiz.body,
      image: "https://quiz-quiq.herokuapp.com#{image_quiz_path(quiz)}"
    }
  end

  def quiq_card_info
    {
      url: 'https://quiz-quiq.herokuapp.com/quizzes',
      title: 'Quiz共有サービス QuiQ',
      description: 'Quizを投稿して、すぐに共有、すぐに解答',
      image: 'https://raw.githubusercontent.com/Madogiwa0124/quiq/master/app/assets/images/top.png'
    }
  end
end
