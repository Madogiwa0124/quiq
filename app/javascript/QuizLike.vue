<template>
  <div>
    <button class="btn btn-success btn-sm" @click="create(1)">
      <i class="fas fa-thumbs-up"></i>
    </button>
    <button class="btn btn-danger btn-sm" @click="create(-1)">
      <i class="fas fa-thumbs-down"></i>
    </button>
    <span class="text-secondary">{{ like_count }} ｲｲﾈ</span>
  </div>
</template>

<script>
import axios from 'axios';
import { csrfToken } from 'rails-ujs'
axios.defaults.headers.common['X-CSRF-Token'] = csrfToken()

export default {
  data: function () {
    return {
      like_count: this.init_like_count
    }
  },
  props: {
    init_like_count: {
      type: Number,
      required: true
    },
    quiz_id: {
      type: Number,
      required: true
    }
  },
  methods: {
    create: function (value) {
      this.like_count += value
      axios.post(`/quizzes/${this.quiz_id}/like`, {
        like: { value: this.like_count }
      });
    }
  }
}
</script>
