import Vue from 'vue/dist/vue.esm'
import QuizLike from '../QuizLike.vue';
import TweetButton from '../TweetButton.vue';

new Vue({
  el: '#like_area',
  components: { QuizLike },
})
new Vue({
  el: '#share_area',
  components: { TweetButton },
})
