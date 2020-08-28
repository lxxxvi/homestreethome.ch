<template>
  <div @click="$emit('show-release-id-event', release.id)" class="sm:w-1/3 clickable mx-2 my-8 p-2 text-center mx-auto">
    <div class="mx-auto">
      <CoverImage :release="release"
                  class-name="shadow-2xl rounded" />
    </div>
    <div class="my-4">
      <div class="text-gray-700 tracking-wide">{{ release.artist }}</div>
      <div class="text-2xl release-title">{{ release.title }}</div>
      <div class="text-gray-700">{{ release.released_on }}</div>
    </div>
  </div>
</template>

<script>
import CoverImage from './CoverImage'

export default {
  props: ['release'],
  components: { CoverImage }
}
</script>

<style scoped>
.clickable {
  @apply cursor-pointer;
}

.clickable:hover .release-title {
  @apply underline;
}
</style>
