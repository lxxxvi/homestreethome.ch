<template>
  <div>
    <button @click="$emit('show-release-id-event', releaseId)" >
      {{ releaseId }}
    </button>
  </div>
</template>

<script>
export default {
  props: ['releaseId']
}
</script>

<style scoped>
button {
  @apply p-5 bg-gray-300;
}
</style>
