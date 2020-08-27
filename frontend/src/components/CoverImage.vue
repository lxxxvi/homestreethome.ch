<template>
    <img :src="release.image_url"
         :class="className"
         :alt="altText()" />
</template>

<script>
export default {
  props: ['release', 'className'],
  methods: {
    altText: function() {
      return `Cover for ${this.release.title}`;
    }
  }
}
</script>

<style scoped>
img {
  @apply inline-block;
  max-width: 300px;
  max-height: 300px;
}
</style>
