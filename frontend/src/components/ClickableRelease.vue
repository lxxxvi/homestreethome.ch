<template>
  <div @click="$emit('show-release-id-event', release.id)" class="clickable mx-2 my-16 p-2 text-center">
    <img :src="release.image_url" class="w-1/2 mx-auto shadow-2xl rounded" />
    {{ release.title }}
  </div>
</template>

<script>
export default {
  props: ['release']
}
</script>

<style scoped>
.clickable {
  @apply cursor-pointer;
}
</style>
