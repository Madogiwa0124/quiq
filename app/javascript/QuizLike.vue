<template>
  <div style="text-align: right">
    <button class="btn btn-success btn-sm" @click="create(1)"><i class="fas fa-thumbs-up"></i></button>
    <button class="btn btn-danger btn-sm" @click="create(-1)"><i class="fas fa-thumbs-down"></i></button>
    <span class="text-secondary">評価 : {{ like_count }} pt</span>
  </div>
</template>

<script>
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
    }
  }
}
</script>
