<template>
  <button class="btn btn-sm  btn-info" @click="tweet()">
    このQuizをTwitterにシェアする<i class="fab fa-twitter"></i>
  </button>
</template>
<script>
const TweetUrl = 'https://twitter.com/intent/tweet?text='
const HostUrl = 'https://quiz-quiq.herokuapp.com'
export default {
  props: ['quiz_id'],
  methods: {
    tweet: function() {
      window.open(TweetUrl + encodeURIComponent(this.tweetText()))
    },
    tweetText: function() {
      return 'Quizを投稿しました！答えてみてね！\n' +
              '#quiq\n' +
              this.quizUrl()
    },
    quizUrl: function() {
      return `${HostUrl}/quizzes/${this.quiz_id}`
    }
  }
}
</script>
