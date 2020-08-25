<template>
  <a :href="href"><slot></slot></a>
</template>

<script>
export default {
  props: ['href']
}
</script>

<style scoped>
a {
  @apply text-transparent bg-clip-text bg-gradient-to-r from-teal-500 to-indigo-500 cursor-pointer tracking-wide;
}

a:hover {
  @apply bg-gradient-to-l;
}
</style>
