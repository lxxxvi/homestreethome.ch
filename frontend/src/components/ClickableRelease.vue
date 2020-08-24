<template>
  <div>
    <button @click="$emit('show-release-id-event', release.id)" >
      {{ release.title }}
    </button>
  </div>
</template>

<script>
export default {
  props: ['release']
}
</script>

<style scoped>
button {
  @apply p-5 bg-gray-300;
}
</style>
