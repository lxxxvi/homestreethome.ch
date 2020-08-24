<template>
  <div>
    <a @click="$emit('close-release-event')">close</a>
    <h1>Release</h1>
    {{ release.title }}
  </div>
</template>

<script>
export default {
  props: ['release']
}
</script>
